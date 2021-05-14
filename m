Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827D1380A5B
	for <lists+linux-input@lfdr.de>; Fri, 14 May 2021 15:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbhENNZA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 May 2021 09:25:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52266 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhENNY6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 May 2021 09:24:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 39A851F432DE
Subject: Re: [RESEND PATCH v7 2/2] arm64: dts: mt8183: add cbas node under
 cros_ec
To:     Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        linux-input@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20210514122051.266169-1-ikjn@chromium.org>
 <20210514122051.266169-3-ikjn@chromium.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <2a216922-c93b-0e1b-0dee-add6cdc9a3c9@collabora.com>
Date:   Fri, 14 May 2021 15:23:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514122051.266169-3-ikjn@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ikjoon,

Thank you for the patch.

On 14/5/21 14:20, Ikjoon Jang wrote:
> Add a 'cbas' device node for supporting tablet mode switch in
> kukui devices.
> 
> Kukui platforms with detacheable base have an additional input
> device under cros-ec, which reports SW_TABLET_MODE regarding
> its base state (e.g. base flipped or detached).
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> 

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
> 
> Changes in v7:
> - remove a label in cbas node
> - fix an erratum in commit message (table --> tablet)
> - dt-binding patchess merged altogether with mt8183 dts
> 
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcfa3370..1512605a438e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
>  			compatible = "google,extcon-usbc-cros-ec";
>  			google,usb-port-id = <0>;
>  		};
> +
> +		cbas {
> +			compatible = "google,cros-cbas";
> +		};
>  	};
>  };
>  
> 
