<template>
  <div class="row">
    <div class="col-md-12 mb-5">
      <div class="col-md-6">
        <div class="input-group">
          <input type="text" class="form-control">
          <button class="btn btn-outline-success" type="button">Create Todo</button>
        </div>
      </div>
    </div>
    <div class="col-md-6 text-center">
      <h4>Todos (Uncompleted)</h4>
      <ul class="list-group">
        <li class="list-group-item">An item</li>
        <li class="list-group-item">A second item</li>
        <li class="list-group-item">A third item</li>
        <li class="list-group-item">A fourth item</li>
        <li class="list-group-item">And a fifth one</li>
      </ul>
    </div>
    <div class="col-md-6 text-center">
      <h4>Completed</h4>
      <ul class="list-group">
        <li class="list-group-item">An item</li>
        <li class="list-group-item">A second item</li>
        <li class="list-group-item">A third item</li>
        <li class="list-group-item">A fourth item</li>
        <li class="list-group-item">And a fifth one</li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    message() {
      return this.$store.state.message
    }
  }
}
</script>
