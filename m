Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8C1D196363
	for <lists+linux-input@lfdr.de>; Sat, 28 Mar 2020 04:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgC1Dnh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Mar 2020 23:43:37 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46937 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgC1Dnh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Mar 2020 23:43:37 -0400
Received: by mail-il1-f195.google.com with SMTP id i75so3469647ild.13;
        Fri, 27 Mar 2020 20:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UVK15i028mkx0jMpDy93kqL7jNl1F+KutZZLwGaGO80=;
        b=YK5ZxzEo6HEEiK1jDNDS80yDjdrmaTfHno66iowxJhYWqC0NRswO5iVrywDnKCJsh6
         KeuIkxgEW5X8Ct/nVCwy2pEdUvyrlVNk8o0cid9q4ON1b6sNEAl3ixsrPyWa9CLfcbmM
         t80TVvuLimGb794UdrWiOy7mzoYijdA1/RV5uVItkeGDa7TKUAhP1ZPsBYu0dE6Uc5RI
         wloO5fqvW1+8lx8050cqx/gpJuURq2W49w04ra0Nbc9SLaAlYsgU66vEdUlyzn3kvrDl
         Eh9Fcj60DWW3b9jI3Y1qSdt2lb0zggNPaeH+koVPY8C/PVaKx6AIOu4u8Ve6g40Pp1+U
         5OTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UVK15i028mkx0jMpDy93kqL7jNl1F+KutZZLwGaGO80=;
        b=fkoltFwCVx+dw+nJFEcejCdKLfZ9lSZyMmdRfIJfmjiKUOoLFiJmplFQv4K5jalZ9M
         XKkeLyzSVLFLlju6dwkKL3mYXahomXMQsGyhoKl2RP6s6Ev8WPhyjK4CvLggGjeVzIFd
         OaZZSOwbp3UGT9zKKPNfHgQHNtj6QvprtSXobEs+VjVUiZ2hQIEcQrhckgfY3gSJrKH8
         WNjq5Xaqwoye7F+2g7jHH5+rfLuwHb+2NJxmEvhuc0HcOOu0ldT+bpehKA7hEhCSvrLc
         iiYrhVK9L4zvqnsrJUI8G1w5x1cT6kDF4HNYoVx/5qwoTLhFTMrvDYP70Vxbh19oQbQr
         qzCQ==
X-Gm-Message-State: ANhLgQ2fDDMauAhePvoncmdy+tK7oQrVPSrGS2Kn2fTC+BmKEs0I+RaP
        aBsDqFSo2FECy9LJiTQhYwqJ8zB1Md48ISGnvFez41Ju
X-Google-Smtp-Source: ADFU+vvrTjRJAhD7aKWKIBES9XdTRJeSXRCB+0DdH2aQVrMCxPqgOw/bsGRDKE8GVKnrhAQIwquJP/XPFaeajb5G488=
X-Received: by 2002:a92:96c6:: with SMTP id g189mr2199320ilh.276.1585367015881;
 Fri, 27 Mar 2020 20:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200225161201.1975-1-git@andred.net> <20200225161201.1975-6-git@andred.net>
 <VI1PR0402MB3485A743C94442533B6840F298E70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR0402MB3485A743C94442533B6840F298E70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 27 Mar 2020 22:43:24 -0500
Message-ID: <CAHCN7x+NJLaKF9SfHw9sDpw6zDUGs_TuD_co7USjQ5hgFDeaHg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our own events
To:     Horia Geanta <horia.geanta@nxp.com>
Cc:     =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Robin Gong <yibin.gong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 2, 2020 at 3:22 AM Horia Geanta <horia.geanta@nxp.com> wrote:
>
> On 2/25/2020 6:12 PM, Andr=C3=A9 Draszik wrote:
> > The snvs_pwrkey shares the SNVS LPSR status register with the snvs_rtc.
> >
> > This driver here should only return IRQ_HANDLED if the status register
> > indicates that the event we're handling in the irq handler was genuinel=
y
> > intended for this driver. Otheriwse the interrupt subsystem will
> > assume the interrupt was handled successfully even though it wasn't
> > at all.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> > Cc: "Horia Geant=C4=83" <horia.geanta@nxp.com>
> > Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Anson Huang <Anson.Huang@nxp.com>
> > Cc: Robin Gong <yibin.gong@nxp.com>
> > Cc: linux-crypto@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-input@vger.kernel.org
> For patches 2-6:
> Reviewed-by: Horia Geant=C4=83 <horia.geanta@nxp.com>
>
> Also imx8mn.dtsi and imx8mp.dtsi will have to be updated.

Is there an update coming for the 8mn family?  I am seeing it not wake
from the power key, and I was hoping to resolve that before i make a
push to submit a new 8MN board for review.

thanks

adam
>
> Thanks,
> Horia
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
