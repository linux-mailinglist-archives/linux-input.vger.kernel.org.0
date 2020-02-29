Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDC4A1748D6
	for <lists+linux-input@lfdr.de>; Sat, 29 Feb 2020 20:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgB2TGF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Feb 2020 14:06:05 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51427 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbgB2TGF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Feb 2020 14:06:05 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D027D2000B;
        Sat, 29 Feb 2020 19:06:00 +0000 (UTC)
Message-ID: <409fce621796948d630e1988e3f8a178e8803344.camel@hadess.net>
Subject: Re: [PATCH] dt-bindings: touchscreen: goodix: support of gt9147
From:   Bastien Nocera <hadess@hadess.net>
To:     Yannick Fertre <yannick.fertre@st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sat, 29 Feb 2020 20:06:00 +0100
In-Reply-To: <1582898271-21073-1-git-send-email-yannick.fertre@st.com>
References: <1582898271-21073-1-git-send-email-yannick.fertre@st.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-28 at 14:57 +0100, Yannick Fertre wrote:
> Add support for it by adding compatible.
> The chip data on GT9147 is similar to GT912, like
> - config data register has 0x8047 address
> - config data register max len is 240
> - config data checksum has 8-bit
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1
> +
>  1 file changed, 1 insertion(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> index d7c3262..9f65d67 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> @@ -21,6 +21,7 @@ properties:
>        - goodix,gt911
>        - goodix,gt9110
>        - goodix,gt912
> +      - goodix,gt9147

It's not going to be much help if you don't have a driver patch that
adds that string to the OF match table. And please CC: the driver
maintainer as well.

>        - goodix,gt927
>        - goodix,gt9271
>        - goodix,gt928

