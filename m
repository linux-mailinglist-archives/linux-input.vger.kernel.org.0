Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48FBD2F008D
	for <lists+linux-input@lfdr.de>; Sat,  9 Jan 2021 15:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbhAIOnp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Jan 2021 09:43:45 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57601 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbhAIOnp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Jan 2021 09:43:45 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3BBDC6004A;
        Sat,  9 Jan 2021 14:37:40 +0000 (UTC)
Message-ID: <5c923458ee8f86efed2ab1c49906dd89789f663b.camel@hadess.net>
Subject: Re: [PATCH 0/2] Add support for Goodix GT9286 chip
From:   Bastien Nocera <hadess@hadess.net>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-input@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Date:   Sat, 09 Jan 2021 15:37:40 +0100
In-Reply-To: <20210109135512.149032-1-angelogioacchino.delregno@somainline.org>
References: <20210109135512.149032-1-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2021-01-09 at 14:55 +0100, AngeloGioacchino Del Regno wrote:
> Add support for the GT9286 chip, tested on F(x)Tec Pro1 (MSM8998).

Can you please add this test information to the commit message for the
goodix.c patch?

Feel free to add my:
Reviewed-by: Bastien Nocera <hadess@hadess.net>
to both patches when you send a v2.

Cheers

> 
> AngeloGioacchino Del Regno (2):
>   input: goodix: Add support for Goodix GT9286 chip
>   dt-bindings: ts: goodix: Add binding for GT9286 IC
> 
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1
> +
>  drivers/input/touchscreen/goodix.c                              | 2
> ++
>  2 files changed, 3 insertions(+)
> 


