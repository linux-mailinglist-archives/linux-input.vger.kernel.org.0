Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC6538CAF6
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 18:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhEUQ3h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 12:29:37 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3621 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233568AbhEUQ3g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 12:29:36 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FmsPx0W5vzQqZq;
        Sat, 22 May 2021 00:24:37 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 22 May 2021 00:28:09 +0800
Received: from localhost (10.52.125.126) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 21 May
 2021 17:28:06 +0100
Date:   Fri, 21 May 2021 17:26:20 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, <kernel@pengutronix.de>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        David Jander <david@protonic.nl>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 1/8] dt-bindings: input: touchscreen: iqs626a: chnage
 node name to pass validation
Message-ID: <20210521172620.00006f66@Huawei.com>
In-Reply-To: <20210521044525.7397-2-o.rempel@pengutronix.de>
References: <20210521044525.7397-1-o.rempel@pengutronix.de>
        <20210521044525.7397-2-o.rempel@pengutronix.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.126]
X-ClientProxiedBy: lhreml746-chm.china.huawei.com (10.201.108.196) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Change typo in title.


On Fri, 21 May 2021 06:45:18 +0200
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> Change node name from iqs626a -> touchscreen to pass dt_binding_check.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/input/iqs626a.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/iqs626a.yaml b/Documentation/devicetree/bindings/input/iqs626a.yaml
> index 0cb736c541c9..ea4f04e2d3ad 100644
> --- a/Documentation/devicetree/bindings/input/iqs626a.yaml
> +++ b/Documentation/devicetree/bindings/input/iqs626a.yaml
> @@ -751,7 +751,7 @@ examples:
>              #address-cells = <1>;
>              #size-cells = <0>;
>  
> -            iqs626a@44 {
> +            touchscreen@44 {
>                      #address-cells = <1>;
>                      #size-cells = <0>;
>  

