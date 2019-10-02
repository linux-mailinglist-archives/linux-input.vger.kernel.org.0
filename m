Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C36E4C8C9A
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 17:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfJBPSS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 11:18:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53308 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfJBPSR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 11:18:17 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92FHqu7121321;
        Wed, 2 Oct 2019 10:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570029472;
        bh=XdNPQjDWDIANjxFkYVhRetRjSoQQX2NhBQD1Yjc+BQw=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=niLLx97YsloDYxsLEY2Ee34kmRfx0AUfa12xUKAEwRb1DBtOrM/heORSb7lERCqdS
         jFSj/6F1INcoFPinQA20t76QJUbwd7hA406B70FpxxzHxplK8uzNGgR/oEXvAeIVtb
         A3Q5mdbBfLz70v4XCRseSRueRqeUCkTeKkN8UHL8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92FHqmC068960;
        Wed, 2 Oct 2019 10:17:52 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 10:17:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 10:17:41 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x92FHpAo044680;
        Wed, 2 Oct 2019 10:17:51 -0500
Date:   Wed, 2 Oct 2019 10:20:03 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
CC:     Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <andriy.shevchenko@linux.intel.com>, <andy.shevchenko@gmail.com>,
        <simon.budig@kernelconcepts.de>, <hdegoede@redhat.com>,
        <fcooper@ti.com>, <linux-input@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <kernel@pengutronix.de>,
        <bcousson@baylibre.com>, <tony@atomide.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <s.hauer@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <shawnguo@kernel.org>,
        <mripard@kernel.org>, <wens@csie.org>
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20191002152003.ag36lrragazsdn5j@ti.com>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-3-m.felsch@pengutronix.de>
 <20190917170743.GO237523@dtor-ws>
 <20190917171814.owcttekv56xgmsts@pengutronix.de>
 <20190917172658.GQ237523@dtor-ws>
 <20190930231146.GA30010@bogus>
 <20191002130018.pvgipl6bkcv3dexj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191002130018.pvgipl6bkcv3dexj@pengutronix.de>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Marco Felsch <m.felsch@pengutronix.de> wrote on Wed [2019-Oct-02 15:00:18 +0200]:
> Hi,
> 
> all of you using a edt,* touchscreen and currently the driver marks
> the touchscreen as wakeup source. To keep backward compatibility I added
> a workaround binding (see below) but Dmitry prefer to use the normal
> "wakeup-source" binding and change the affected device-tree's
> (discussion below). Can you give me your ack/nack for Dmitry's solution?

So, if I understand this correctly, currently the driver always assume it
is a wakeup source regardless if the "wakeup-source" DT property being
present or not. And the proposed change now is to fix the driver so that it
will assume a wakeup source role only if the DT property is present?

If that is the case then ACK from my side for the AM43x devices.

Regards,
Benoit

> 
> Regards,
>   Marco
> 
