Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 567B35B61D
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 09:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfGAHw7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 03:52:59 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36181 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfGAHw7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 03:52:59 -0400
Received: by mail-pg1-f195.google.com with SMTP id c13so5617610pgg.3;
        Mon, 01 Jul 2019 00:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rdcIi2cumO41Y4zgqEx+RI7IBrTExhB5mGxaS338vMg=;
        b=EKBIvdtpU4JjTSu+btioEx6SVuPsS2YcCGeGEzSHD8Mqpbt3QjFzV01J0HGdAsZMxA
         miNJP3pvKvK5Vv+QBePJUFMAkF288+oNkNeqoj4C/DTPSCZQdZjVWd0S6PUHXogRcXUA
         LkI1bUyYnk4xpBuAeWcTqic5UQ5H/XSi+WrjJofVuO+MJwUy7qq5bH2UnIZDLsheczc/
         X2ynD5HruKB9PzJ8PJTO4+YJymag+fizsW1DpLODc4NNbZ/dfa3eAbp56Yy9ogNwHlIV
         UE7clsbPccJZVbnCX4wiWFeH+PNqnTE4xtfPm/R6metV6iITyl/Gz0sBO8kHFuSdzR0V
         VhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rdcIi2cumO41Y4zgqEx+RI7IBrTExhB5mGxaS338vMg=;
        b=kx6g0YwVHg+9vNJA+409opAoIaSyateStgrqgQgLiGOEOiZsW6MP5TSQu7u0mYiTZ1
         myal7tgHJBjqR/9lNjfX9GDGpYf3zSPuIdmReDJ+gZY4R0bklVrQuNhAp1j4F/544gan
         nOf7Zl5kj8VWEVfI7d9Wi7GmLeFBQ66K8vZ2ecjJ6gklBnVAy/AhdUhMVW4PYia2v/k4
         JRcbZjgJIE0yQusr9u6UjEbfs3SnwpCyEmsXGi4B65tjB6dHS+7OCkIcp8c90Qe+nIo4
         /aCX9O/u4Qmg/FabF0tndgWs+i1XmYca/syKUSu4aePFzimtJChEbUjFPlHM9L/Br5vH
         7muQ==
X-Gm-Message-State: APjAAAX0Z6XUSxmlbOvSxn5/1xujZ+XUqzVJ7JvuJBCd4ZT1b9tvKOen
        tGwHMKDXiNybqh6Mb9ncW7E=
X-Google-Smtp-Source: APXvYqz+5OQaUvqEiswzedP1HrM6edG/iaiLW0IB1Z0Zqu6vyMD+jY20kS9fCmT0tw3iTMQujMtKbQ==
X-Received: by 2002:a17:90a:3585:: with SMTP id r5mr30793616pjb.15.1561967578351;
        Mon, 01 Jul 2019 00:52:58 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id t96sm8530996pjb.1.2019.07.01.00.52.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 00:52:57 -0700 (PDT)
Date:   Mon, 1 Jul 2019 00:52:55 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Olof Johansson <olof@lixom.net>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Arnd Bergmann <arnd@arndb.de>, Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Christian Hoff <christian_hoff@gmx.net>,
        Tony Lindgren <tony@atomide.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Gabriel Fernandez <gabriel.fernandez@st.com>,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Brian Masney <masneyb@onstation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/4] input: keyboard/mouse/touchscreen/misc: Use
 dev_get_drvdata()
Message-ID: <20190701075255.GD172968@dtor-ws>
References: <20190701032342.25971-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701032342.25971-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fuqian,

On Mon, Jul 01, 2019 at 11:23:12AM +0800, Fuqian Huang wrote:
> Using dev_get_drvdata directly.
> 

I prefer using proper bus accessors.

Thanks.

-- 
Dmitry
