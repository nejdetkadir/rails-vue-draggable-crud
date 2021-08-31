<template>
  <div class="row">
    <div class="col-md-12 mb-5">
      <div class="col-md-6">
        <div class="input-group">
          <input type="text" v-model="todo.content" class="form-control">
          <button class="btn btn-outline-success" type="button" @click.prevent="createTodo">Create Todo</button>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <h4 class="text-center">Todos (Uncompleted)</h4>
      <draggable class="list-group" :list="list.uncompleted" group="todos" @change="log">
        <todo-card :todo="todo" v-for="(todo, index) in list.uncompleted" :key="index"/>
      </draggable>
    </div>
    <div class="col-md-6">
      <h4 class="text-center">Completed</h4>
      <draggable class="list-group" :list="list.completed" group="todos" @change="log">
        <todo-card :todo="todo" v-for="(todo, index) in list.completed" :key="index"/>
      </draggable>
    </div>
  </div>
</template>

<script>
import Rails from "@rails/ujs";
import draggable from "vuedraggable";
import TodoCard from "./TodoCard.vue"

export default {
  data() {
    return{
      todo: {
        content: ""
      },
      list: {
        uncompleted: JSON.parse(this.uncompleted_data),
        completed: JSON.parse(this.completed_data)
      }
    }
  },
  props: ["completed_data", "uncompleted_data"],
  components: {
    draggable,
    TodoCard
  },
  methods: {
    createTodo(){
      const data = new FormData();
      data.append("todo[content]", this.todo.content);

      Rails.ajax({
        beforeSend: () => true,
        url: "/todos",
        type: "POST",
        data,
        dataType: "json",
        success: (res) => {
          if (res.id > 0) {
            this.list.uncompleted.push(res);
            this.todo.content = "";
          } else {
            window.console.log(res);
          }
        }
      })
    },
    log(evt) {
      if (evt.added) {
        const data = new FormData();
        data.append("todo[completed]", !evt.added.element.completed);

        Rails.ajax({
          beforeSend: () => true,
          url: `/todos/${evt.added.element.id}`,
          type: "PUT",
          data,
          dataType: "json",
          success: (res) => {
            if (res.completed != !evt.added.element.completed) {
              window.console.log(res);
            }
          }
        })
      }
    }
  }
}
</script>
