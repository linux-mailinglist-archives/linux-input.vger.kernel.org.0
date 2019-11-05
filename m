Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA825EFECF
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 14:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388987AbfKENjW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 08:39:22 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44729 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387985AbfKENjW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 08:39:22 -0500
Received: by mail-lf1-f68.google.com with SMTP id v4so15148667lfd.11
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 05:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lx5R9M91hw7AQVda3fVTqgIBHSsPMaxO/h4yjUZoaW8=;
        b=k6g6cO2fM1MMRiLFe2P8iE5XAHYbi+WXSuOSXE8xnJWuIhVPed3MbZ3m9hKARNQrHk
         N5WsKk2MfaUglbZIegtZ+++oeNUoQKfoQGyjO3SkiX4yyEoBbUaPQJ0srvCfF23bzzeS
         1W9jF9YSUZ++8ksYphJyafz4H95+Ma3x06UYDvbFJa+2uclCviVZM0gLqwXOLcYPmtOh
         qFGVfJ9bPsQurvh7Cnl7/1j0+kp4JTmKp1H2DUhva8fqEkh8eyUw+dey8YwK/voPFxW+
         tOZmsBPzF8sfuzheVITh7K3g5N0ayQKUe5OEUAdiPPYxZ9cIXZcE+ey48EkybVSAy5e8
         4kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lx5R9M91hw7AQVda3fVTqgIBHSsPMaxO/h4yjUZoaW8=;
        b=IolM+h8eo3WRVu8T6Rf1zguai7mEVR6mmogy6CtMnR3K9yDymHpIm75s3WZgJztp4z
         1xxhT2AJTxjci4gsI7lFpTfvNRQEpjiew013LcpSnsjyb4LBHzhipdPLHLJajRtFjOx8
         LoKNQXGfptzjEtR4FgpKJXvTnw3A3TUSVYolJsach0/qK6nKNmQCrTKP+oEIyUMZ2W7x
         IW/dBEHLZSssb5ifAnT1AYPGli8Wbx8UZbsVEhg5oIZUSMbS4GZsxtP0MLZiN9bKl2pl
         pwDbTtwHCO6N1K67EzGrCJCQ9L71oH7zPt6CVm31G8OcDH189pCD6UG7cXMXBtsuGoW8
         BEKg==
X-Gm-Message-State: APjAAAW6m0b3RxuIOF2UruTU7EA7UKtDfInCRDNWqUgxGvp6oC9z4Mr7
        YA3EYm3I93ht0A8uEgfhI0FRMrwTVx8mLHO2twM=
X-Google-Smtp-Source: APXvYqy6/Bvo/lpLBs2iQA2NV4NQ/VGk+XF/CFmx4niHqIZM0x+xiZ0F6hLG2xqiT2ABjcj3NVLdXYSKMgiABYhAXv4=
X-Received: by 2002:ac2:4a8a:: with SMTP id l10mr13068099lfp.185.1572961159968;
 Tue, 05 Nov 2019 05:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20191105133555.21893-1-aford173@gmail.com>
In-Reply-To: <20191105133555.21893-1-aford173@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 5 Nov 2019 10:39:14 -0300
Message-ID: <CAOMZO5CaAAkO5PwWZwtj_afJnH=Ad-EJyppV3LuH+XpDuNWxRg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6q-logicpd: Enable ili2117a Touchscreen
To:     Adam Ford <aford173@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 5, 2019 at 10:36 AM Adam Ford <aford173@gmail.com> wrote:
>
> The LCD used with the imx6q-logicpd board has an integrated
> ili2117a touch controller connected to i2c1.
>
> ili2117 support is scheduled to be introduced for Kernel v5.5.

Maybe this sentence could be put below the --- line?

It will look strange to read this commit log in the future :-)

> This patch adds the node to enable this feature.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm/boot/dts/imx6q-logicpd.dts b/arch/arm/boot/dts/imx6q-logicpd.dts
> index d96ae54be338..a5025f3009a9 100644
> --- a/arch/arm/boot/dts/imx6q-logicpd.dts
> +++ b/arch/arm/boot/dts/imx6q-logicpd.dts
> @@ -73,6 +73,16 @@
>         status = "okay";
>  };
>
> +&i2c1 {
> +       ili_touch: ilitouch@26 {

node names should be generic, so:

touchscreen@26
