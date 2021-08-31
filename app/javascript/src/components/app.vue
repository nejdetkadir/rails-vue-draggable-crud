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
    <div class="col-md-6 text-center">
      <h4>Todos (Uncompleted)</h4>
      <ul class="list-group">
        <li class="list-group-item" v-for="(todo, key) in list.uncompleted" :key="key">{{ todo.content }}</li>
      </ul>
    </div>
    <div class="col-md-6 text-center">
      <h4>Completed</h4>
      <ul class="list-group">
        <li class="list-group-item" v-for="(todo, key) in list.completed" :key="key">{{ todo.content }}</li>
      </ul>
    </div>
  </div>
</template>

<script>
import Rails from "@rails/ujs";

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
    }
  }
}
</script>
