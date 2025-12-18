import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  server: {

    allowedHosts: [
          'hobbee.ukilolll.com',
        ],

    proxy: {
      "/api": {
        target: "hobbee.ukilolll.com",
        changeOrigin: true,
        secure: false,
        rewrite: (path) => path.replace(/^\/api/, ""),
    },
  },
}
});