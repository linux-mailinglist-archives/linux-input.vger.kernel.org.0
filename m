Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866E2215F4E
	for <lists+linux-input@lfdr.de>; Mon,  6 Jul 2020 21:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgGFT1M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 15:27:12 -0400
Received: from forward500p.mail.yandex.net ([77.88.28.110]:58470 "EHLO
        forward500p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726329AbgGFT1M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Jul 2020 15:27:12 -0400
X-Greylist: delayed 381 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Jul 2020 15:27:10 EDT
Received: from mxback19j.mail.yandex.net (mxback19j.mail.yandex.net [IPv6:2a02:6b8:0:1619::95])
        by forward500p.mail.yandex.net (Yandex) with ESMTP id 747DC9400DB;
        Mon,  6 Jul 2020 22:20:48 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback19j.mail.yandex.net (mxback/Yandex) with ESMTP id Icus1Vpk93-KluuMZ36;
        Mon, 06 Jul 2020 22:20:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail; t=1594063248;
        bh=ZHGsVMNkZpFDM7El5aZ1YiZR+LlM3nbtR3lE1SqzI3I=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=ABiIRI47iGjTPoQRdrfSPg6kjExVzno1ruGriDYOupJIuBSZ777M4Z2BNm4ZiCH59
         BqronQEURmI7702ILgvJHo8VBgTSJ/4yaZ5VCaLRXe4pXZfgpjlx+AdpZ6GSWVgaQb
         LcZIzMApkAa86yyqabbQx3jImJtaDHspfV/ywI0A=
Authentication-Results: mxback19j.mail.yandex.net; dkim=pass header.i=@0upti.me
Received: by iva2-15a880c55b23.qloud-c.yandex.net with HTTP;
        Mon, 06 Jul 2020 22:20:47 +0300
From:   Ilya K <me@0upti.me>
To:     "lyude@redhat.com" <lyude@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Gaurav Agrawal <agrawalgaurav@gnome.org>,
        Yussuf Khalil <dev@pp3345.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dennis Kadioglu <denk@eclipso.email>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Joe Perches <joe@perches.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <2f68590f3352c6384efdf9838f16837d5990d1fe.camel@redhat.com>
References: <20200703143457.132373-1-me@0upti.me> <2f68590f3352c6384efdf9838f16837d5990d1fe.camel@redhat.com>
Subject: Re: [PATCH] input/synaptics: enable InterTouch for ThinkPad X1E 1st gen
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Mon, 06 Jul 2020 22:20:47 +0300
Message-Id: <1295871594063151@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

(sorry for resending - the previous message got sent as HTML and bounced off the mailing list)

This actually made me retest it just now - it most definitely works, both by tapping and by actually clicking the button.

06.07.2020, 20:22, "Lyude Paul" <lyude@redhat.com>:
> FWIW it's not placebo, it's why I always immediately notice when starting up a
> new ThinkPad sample from lenovo if RMI4 is enabled or not :).
>
> Anyway thank you for the patch, assuming you double-checked that clicking with
> the clickpad still works (I made this mistake last time when trying to enable
> this for the second generation X1 extreme):
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> On Fri, 2020-07-03 at 17:34 +0300, K900 wrote:
>>  From: Ilya Katsnelson <me@0upti.me>
>>
>>  Tested on my own laptop, touchpad feels slightly more responsive with
>>  this on, though it might just be placebo.
>>
>>  Signed-off-by: Ilya Katsnelson <me@0upti.me>
>>  ---
>>   drivers/input/mouse/synaptics.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>>  diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
>>  index 758dae8d6500..4b81b2d0fe06 100644
>>  --- a/drivers/input/mouse/synaptics.c
>>  +++ b/drivers/input/mouse/synaptics.c
>>  @@ -179,6 +179,7 @@ static const char * const smbus_pnp_ids[] = {
>>           "LEN0093", /* T480 */
>>           "LEN0096", /* X280 */
>>           "LEN0097", /* X280 -> ALPS trackpoint */
>>  + "LEN0099", /* X1 Extreme 1st */
>>           "LEN009b", /* T580 */
>>           "LEN200f", /* T450s */
>>           "LEN2044", /* L470 */
