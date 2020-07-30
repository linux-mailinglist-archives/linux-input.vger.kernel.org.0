Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16709232BAE
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 08:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgG3GGG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 02:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgG3GGG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 02:06:06 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0203DC061794;
        Wed, 29 Jul 2020 23:06:06 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d188so8368775pfd.2;
        Wed, 29 Jul 2020 23:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FaJEFEelYrJSReV7cGpaC8DcaS6bvQpHJ9kF+pWSQi0=;
        b=PN/WQ+nnGUctp0OFQylI5UunOgmc+MkXU8PIheUfmAg4EqLc9dl95Aab+Wjvr+TS8/
         ZDENTHneGbDBaO+VBRrGcUzXI52O+zdVBquAlMyC6ASkvX4jRMGS5xosOknX/jz9Jqx9
         3WTeAUBRnBrbFAOZPUvFDEDlsxWAMoO8EfopzEzJe2ZyBaF6XR4ThxXgYHG81oRCkPk0
         2xDxr7O9T7Cid8pcCLq/uen+v8kr7PQjayeexUp8z1zoYC7q2RLV9zuEFCa30EEMK+iu
         UpI+DfbBYsEpWnqhxc/auost160A+G4VVWXPJg9lMoxsGmWnU9RnT3LpbvPW1vHTF9sh
         FeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FaJEFEelYrJSReV7cGpaC8DcaS6bvQpHJ9kF+pWSQi0=;
        b=cxyo6gnSflIVn21FbTHAK3Ks6Aoa41PS86AgPwil0tHURaNI/0j123hBiFkpLfqsGz
         JpcxVRP8mSegRE8D4xa2Q1WmEw0duhAgyYczsT+cVQT5B2hTwKjX6BkY+ZKBGMEoDs5x
         9dhKXLZB1QEJlNLY5aWLUFRyrGoCBsHcwkHi3QlOnJUgiBHFaCiE4CHda1/Gf5Ifdox2
         T14WSpsNs31mfwTyTHBmzhXBTughup1QWaWH8ra4cKUpo3JKDxmfpqmtXkA0tOmAmnf3
         phP3t+KPnfkCh2Oz6r4Y3aUhuOhNFDseB8/2s6Jx+ih3yNhv1OzxMZfwqID9tt3jF6pu
         Nt+g==
X-Gm-Message-State: AOAM5317nnDHTHZ1wDysrIu13XQ92H/gYMhjn5Hn64UJp5/AQ5SBQPf+
        9/M6vUb7Ju5XqpLy0oJTd3w=
X-Google-Smtp-Source: ABdhPJy9L+ZvNhtXvmpzaiU3k7r+UDFDMJguFZV3kAjHpgbPyHHyw5I//L2uzuxJu7pDQ9APA8BYIA==
X-Received: by 2002:a63:69ca:: with SMTP id e193mr32541471pgc.148.1596089165250;
        Wed, 29 Jul 2020 23:06:05 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q13sm4775816pjc.21.2020.07.29.23.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 23:06:04 -0700 (PDT)
Date:   Wed, 29 Jul 2020 23:06:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
        Robin Gong <yibin.gong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/3] Input: snvs_pwrkey - only IRQ_HANDLED for our own
 events
Message-ID: <20200730060601.GE1665100@dtor-ws>
References: <20200723074314.3304-1-horia.geanta@nxp.com>
 <20200723074314.3304-4-horia.geanta@nxp.com>
 <20200729075513.ckjnhfv3dxuesvsi@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200729075513.ckjnhfv3dxuesvsi@pengutronix.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

On Wed, Jul 29, 2020 at 09:55:13AM +0200, Marco Felsch wrote:
> Hi,
> 
> On 20-07-23 10:43, Horia Geantă wrote:
> > From: André Draszik <git@andred.net>
> > 
> > The snvs_pwrkey shares the SNVS LPSR status register with the snvs_rtc.
> > 
> > This driver here should only return IRQ_HANDLED if the status register
> > indicates that the event we're handling in the irq handler was genuinely
> > intended for this driver. Otheriwse the interrupt subsystem will
> > assume the interrupt was handled successfully even though it wasn't
> > at all.
> 
> After checking the RM and the imx6qdl.dtsi I'm not very sure that this
> is right since the snvs-powerkey has a seperate irq-line. So we can be
> sure that this irq is for us. If this is the case we don't need to check
> the SNVS_LPSR_REG instead we only need to clear it.

Wouldn't we want to know if for some reason we get spurious interrupts?

Thanks.

-- 
Dmitry
