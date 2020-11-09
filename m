Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB092AB14A
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 07:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbgKIGcJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 01:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729468AbgKIGcJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 01:32:09 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D60C0613CF;
        Sun,  8 Nov 2020 22:32:09 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id c20so7160448pfr.8;
        Sun, 08 Nov 2020 22:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1p7d0d9GOMmZBOeyHHFhyy9AVG67VeJF2Nzsr/qJzpk=;
        b=GcFFx//QNAhRzI1XUoo0gqJ5KpycUz6anH6cDHG7VEa9V82Cbe4dD8G15jvxMXRt/6
         jVMCnIbj34Jg7r+P8iE0W0czISvrrOZl/GI2lyhCmIZPl3ZKk4HtwrU3msAZA70WALnr
         beYe/kIo58UYQZk2C6bA2IKfxyCz23sdPlOv0ghSg74rceUW/UPVtjIS5vDf5qBzLaAS
         G8SDplJ3SuF8FDh+f9R5eMTws5iO95GNQLJrEXPz409ctKqIfOsa+WIwRiVkIxno8LAf
         zfPqsua/jz5XGfh7PQzzVu2SogP4spkqlt2QKVfdQTtAZ2NCWovtLkV7UQQPu/mQETTN
         dCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1p7d0d9GOMmZBOeyHHFhyy9AVG67VeJF2Nzsr/qJzpk=;
        b=H/Uxw+JO+OMsg/Ax+EdjkSgOj3rJjNWBStLEHGuGQ41zuNmvh0UhV+M7rvmKGvBXh0
         307UzTR+3yP90A5fKfDioDH5zyEOJSyK34udEeK5T99LgXc9OevbOSKCRNqBOhPOnmwP
         5FdY6BsExQ00U3MepZqqjlEfx9O+bhr/ddMKxcJOUyU/2Nvm3LjDjJSlAVVWgTLumwCS
         LgYb2Cp5Q5dSnjLHRG0N9cQ/RqdueOXVCZHompYYf82XKPiqh0KXAOtwLrOVL2Vb+aVT
         CVnc3UcgsbFortOixGgR467S0bmvZE0yPumskrb3kVz85MBRQlkSyU0ry2VJvrjmeGzo
         p9XA==
X-Gm-Message-State: AOAM532T04PimZ0ttw8PlMEtJvoYZW7JiZWjxQZEXu+Z+IuwUh16FzAH
        HbKdE9olx3Ple2TpFyzJgIw=
X-Google-Smtp-Source: ABdhPJw9tlytJUPo9WePeCIY5srGWQXzFd+zwCMvSKzAm5fJMpQfk6l84DMwVGailGnIkZh9wnj4bQ==
X-Received: by 2002:a63:f91f:: with SMTP id h31mr12039632pgi.0.1604903529162;
        Sun, 08 Nov 2020 22:32:09 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z11sm10293305pfk.52.2020.11.08.22.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 22:32:08 -0800 (PST)
Date:   Sun, 8 Nov 2020 22:32:06 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dudley Du <dudl@cypress.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 03/20] input: mouse: cyapa_gen5: Fix obvious abuse of
 kernel-doc format
Message-ID: <20201109063206.GP1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-4-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:10PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/mouse/cyapa_gen5.c:392: warning: Function parameter or member 'cyapa' not described in 'cyapa_i2c_pip_write'
>  drivers/input/mouse/cyapa_gen5.c:392: warning: Function parameter or member 'buf' not described in 'cyapa_i2c_pip_write'
>  drivers/input/mouse/cyapa_gen5.c:392: warning: Function parameter or member 'size' not described in 'cyapa_i2c_pip_write'
>  drivers/input/mouse/cyapa_gen5.c:444: warning: Function parameter or member 'cyapa' not described in 'cyapa_empty_pip_output_data'
>  drivers/input/mouse/cyapa_gen5.c:444: warning: Function parameter or member 'buf' not described in 'cyapa_empty_pip_output_data'
>  drivers/input/mouse/cyapa_gen5.c:444: warning: Function parameter or member 'len' not described in 'cyapa_empty_pip_output_data'
>  drivers/input/mouse/cyapa_gen5.c:444: warning: Function parameter or member 'func' not described in 'cyapa_empty_pip_output_data'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Dudley Du <dudl@cypress.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
