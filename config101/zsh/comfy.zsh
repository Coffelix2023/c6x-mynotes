# ${ZDOTDIR}/.comfy.zsh
# >>>>>>>> [update 2026-01-17] >>>>>>>>

#====================
# ComfyUI Config : Comfyui的配置
#====================

mynodes() {
    cd ${MYNODES}
    source "${CF_LOCAL}/.venv/bin/activate"
    echo '将清理以下隐藏文件:'
    fd_prt 9 .D*
    fd_del 9 .D*
}

# 下载modelscope
ms_down() {
    modelscope download --model $1 $2 --local_dir $3
}

# ========📌 快捷拷贝自定义节点 mac -> fedora
copy_mynodes() {
    echo "☺️ 正在从Mac拷贝FelixNodes到Fedora"

    rsync -avh \
        --exclude="**/*.pyc" \
        --exclude="**/.D*" \
        --exclude="**/._*" \
        ${MYNODES}/core \
        ${MYNODES}/custom_routes \
        ${MYNODES}/JS \
        ${MYNODES}/nodes \
        ${MYNODES}/tst_nodes \
        ${MYNODES}/__init__.py \
        ${FE_MYNODES}

    echo "✅ Done"
}

# ========📌 创建新节点
new_mynodes() {
    echo "创建新节点,输入名称,例如'myNode'"

    cp ${MYNODES}/nodes.disabled/templates/template.py \
        ${MYNODES}/fx_$1.py

    echo "✅ 模版创建完成: ${MYNODES}/fx_$1.py "
}

# ========📌 备份自定义节点
publish_mynodes() {
    echo "☺️ 发布 mynodes 到 publish/ "

    local now
    now="$(date +%F_%H)"

    #创建当日文件夹: +%F: 2025-01-01, +%F_%H%M%S: 增加2位数时间
    mkdir -p ${MYNODES}/_nodes.disabled/publish/${now}

    rsync -avh --progress \
        --exclude="**/*.pyc" \
        --exclude="**/.*" \
        ${MYNODES}/core \
        ${MYNODES}/custom_routes \
        ${MYNODES}/JS \
        ${MYNODES}/nodes \
        ${MYNODES}/user \
        ${MYNODES}/__init__.py \
        ${CF_DISK}/user/default/user.css \
        ${MYNODES}/_nodes.disabled/publish/"${now}"

    echo "✅ Done: saved to ${MYNODES}/_nodes.disabled/publish/${now}"
}

# ========📌 启动
comfyrun() {
    echo "启动 ComfyUI (comfy_up : 升级)"

    cd ${CF_LOCAL}
    source "${CF_LOCAL}/.venv/bin/activate"

    if [[ -f "c6x_config/cf_run_c6x.sh" ]]; then
        bash c6x_config/cf_run_c6x.sh
    else
        echo "⚠️ 启动文件不存在 (${CF_LOCAL}/c6x_config/cf_run_c6x.sh)"
    fi
}

# ========📌 升级
comfyup() {
    echo "正在更新ComfyUI..."
    cd ${CF_LOCAL}
    source "${CF_LOCAL}/.venv/bin/activate"

    if [[ -f "c6x_config/cf_update_c6x.sh" ]]; then
        bash c6x_config/cf_update_c6x.sh
    else
        echo "⚠️ 启动文件不存在 (${CF_LOCAL}/c6x_config/cf_update_c6x.sh)"
    fi
    echo "✅ comfyup 执行完毕!"
}

# ========📌 禁用所有custom_nodes后进行启动检查
comfycheck() {
    echo "🤗 启动并进入ComfyUI工作区..."
    cd ${CF_LOCAL}
    source "${CF_LOCAL}/.venv/bin/activate"

    if [[ -f "c6x_config/cf_check_c6x.sh" ]]; then
        bash c6x_config/cf_check_c6x.sh
    else
        echo "⚠️ 启动文件不存在 (${CF_LOCAL}/cf_check_c6x.sh)"
    fi
}

# ========📌 进入comfyui本地目录并激活comfyui venv
comfydir() {
    echo "进入 ComfyUI 本地主目录并激活对应虚拟环境"
    cd ${CF_LOCAL}
    source "${CF_LOCAL}/.venv/bin/activate"
}

# <<<<<<<< .comfy.zsh END <<<<<<<<
