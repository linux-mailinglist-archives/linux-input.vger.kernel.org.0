Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B63A7220
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 20:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbfICSBZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 14:01:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43418 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfICSBZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 14:01:25 -0400
Received: by mail-wr1-f67.google.com with SMTP id y8so18439201wrn.10;
        Tue, 03 Sep 2019 11:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gcfzVbQ+rKDOGnegOjsAEqYWI+GdZnQ3k+ia0pvRnA0=;
        b=AK4UlO9/3XMBJrUQmLU0N+APB6OT6vxsHawNCfkRK0MVbWjhxuHdyL6vCIFnirdRsu
         iO0w/TJ0AJyIay3oTszEsWqxdYas0LxRXo4YdITfbxEj5LoXjHxNbrBpyG/NPW8DuRG0
         13IvwuNuiTSsSIvTAy/x40RFgL2cgqRy8noMxuyKMy8Q/v1JEG7yz9HqNkL3SitzGdcA
         dyon201WEN6ff+2v9zNlVsTtEDwbQCbLb9Nczkk1hLkH22Kcv+c0JQUX7KNFjK0B2UbR
         +w2+BWOTy6PD7OGZnZwduk8ytKxCSslDWnhah6ziaoy5FiV3fdnxv5oMOHh17rtJd8vX
         86sQ==
X-Gm-Message-State: APjAAAX7H42fKuakoxNA3lRpD0KVE45r+E4HEAVJY/89/kgi9/w7YO+f
        xzz4JL3/xMJcE2kIRg9KNg==
X-Google-Smtp-Source: APXvYqwEQSI3B8nh2h01ajBdLNxMQRoIvSAtmLz37oEoyS0DM58xIf2yBGVy/QlIYp7oeqicEt10cQ==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr41169265wrn.62.1567533683269;
        Tue, 03 Sep 2019 11:01:23 -0700 (PDT)
Received: from localhost ([176.12.107.132])
        by smtp.gmail.com with ESMTPSA id d1sm17219898wrs.71.2019.09.03.11.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 11:01:22 -0700 (PDT)
Date:   Tue, 3 Sep 2019 19:01:19 +0100
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com, mripard@kernel.org,
        olof@lixom.net, arnd@arndb.de, jagan@amarulasolutions.com,
        bjorn.andersson@linaro.org, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, stefan@agner.ch,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        yuehaibing@huawei.com, tglx@linutronix.de, ronald@innovation.ch,
        m.felsch@pengutronix.de, ping.bai@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V3 1/5] dt-bindings: fsl: scu: add scu key binding
Message-ID: <20190903180119.GA5856@bogus>
References: <1567546600-21566-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567546600-21566-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue,  3 Sep 2019 17:36:36 -0400, Anson Huang wrote:
> NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
> system controller, the system controller is in charge of system
> power, clock and scu key event etc. management, Linux kernel has
> to communicate with system controller via MU (message unit) IPC
> to get scu key event, add binding doc for i.MX system controller
> key driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V2:
> 	- use "key" instead of "pwrkey" as the key function can be defined in DT.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
