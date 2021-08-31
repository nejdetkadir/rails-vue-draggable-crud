<template>
  <li class="list-group-item">
    <div class="d-flex justify-content-between align-items-center">
      <h6 class="mb-0 mt-0">{{ todo.content }}</h6>
      <button class="btn btn-sm btn-danger">Delete</button>
    </div>
  </li>
</template>

<script>
export default {
  props: {
    todo: {
      type: Object,
      required: true
    }
  }
}
</script>