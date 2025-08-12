Return-Path: <linux-input+bounces-13936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1473B22623
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 13:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA11D1B616F1
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 11:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4385C2EE5F9;
	Tue, 12 Aug 2025 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="n6t3BnLf"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC992EF648;
	Tue, 12 Aug 2025 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754999473; cv=none; b=urMMWqHgCEWye38dPZpd/i1hlc7BLT4stFLCciCodqXuJ27YsvnIEZn3ITc3JoRkVJsulerURjIbchRRSTk94OXmKR2GT5rhLO7vaOT6R5pNQtlqbjpgXqqAe4OXR5B2xMKMelGSSPMUkxJSE+wsvyDgKcEO+ZNdfEqNov5AVyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754999473; c=relaxed/simple;
	bh=OeNR1AFJawWK739iK6YFICqeOBK7tlOoCsfcxH2OZ5U=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=t00gjVfLHXr7Ked03t7p14oqOeBG3UoE9yjpyPcksSHS8xUg4PJtlxqJyPq2iRgoIys5D9KqEE6FS3hpC2CkCAHInKyncxvL0lpt+TcI+aL0iPp+t4Scqti/B2/Z5l4mWS/AE1I02PN20Xu4rESJ4p0pfhyGbNDF+0zzsQZHhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=n6t3BnLf; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754999464; x=1755604264; i=markus.elfring@web.de;
	bh=Rq2KOPychdY5UEP/yn2e5JfUJlfZ/AgCxyEFqYLUALA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n6t3BnLf+CzzfpBCyvAsALBLat0DOTq9AFYmh1XZ+Dq2bAM4pg9+5XJxKNaUy8QH
	 ucXrfZJY5zyrxhYB1d/wK3OjFS3AqAsf0Qme0u1rmwcDk9a7EB+cgG22q/trZzlzA
	 LzKoXMp902OfXz9l6SHgKy2Vg1L6rIz3hcIqytOKDKz2YA4IGmUijl2ms+/u1R4jm
	 R6uCR6azMpjNp1PX0DSY8DwbFF5Vbrlzu4RxhbyRWlyStyAxaBr0ilPTjCXHUgcC1
	 pJX7iM7lJX6/cRTUTv/FXAutDbB001O7tRBtbKUyiqyo+YB/mD9B6FiI86Mh/xOn6
	 C8VacItMTvTI3cXXdg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.213]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mmyqx-1uLmRD1wut-00qcyl; Tue, 12
 Aug 2025 13:51:04 +0200
Message-ID: <cd294a60-1696-4ba0-8b25-ea259e8ccfb5@web.de>
Date: Tue, 12 Aug 2025 13:51:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Leo L. Schwab" <ewhac@ewhac.org>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Kate Hsuan <hpa@redhat.com>
References: <20250812065327.515098-2-ewhac@ewhac.org>
Subject: Re: [PATCH v2] HID: lg-g15 - Add support for Logitech G13.
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250812065327.515098-2-ewhac@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C6K8S4zGwIL4C73JY9Fh3xvl+kWqWzg2Qj8IBzecSCxnO7c1I7m
 GiNhg2CTk1Rm7FUwLmNw8FPXvoKdelI45R0MuL1XGhkToIcFSIPtHmV+CLOnnGN82KNtOGp
 Iv0HJ4IT9sxJk3IpCFABBslshjioVKpYCFUT5gX6NzX5FGaBwGEmlz1KV800kXGuu/FD9ld
 r1owznRjpwfgYFjm6MCaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+F8zJMZGOoo=;DzbeJD8ipgGozyLVEDq4do7QtGZ
 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
 4FH3+M//QBA==

=E2=80=A6
> +++ b/drivers/hid/hid-ids.h
=E2=80=A6
> +static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
> +{
=E2=80=A6
> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
=E2=80=A6
> +	if (hw_brightness_changed) {
> +		led_classdev_notify_brightness_hw_changed(
> +			&g15->leds[0].cdev,
> +			TEST_BIT(rep->keybits, 23) ? LED_FULL : LED_OFF);
> +	}
> +#endif
=E2=80=A6
> +static void lg_g13_init_input_dev(struct hid_device *hdev,
> +				  struct input_dev *input, const char *name,
> +				  struct input_dev *input_js, const char *name_js)
> +{
=E2=80=A6
> +	for (int i =3D 0;  i < ARRAY_SIZE(g13_keys_for_bits);  ++i) {
> +		if (g13_keys_for_bits[i]) {
> +			input_set_capability(input, EV_KEY, g13_keys_for_bits[i]);
> +		}
> +	}
=E2=80=A6
> +	for (int i =3D 0;  i < ARRAY_SIZE(g13_keys_for_bits_js);  ++i) {
> +		if (g13_keys_for_bits_js[i]) {
> +			input_set_capability(input_js, EV_KEY, g13_keys_for_bits_js[i]);
> +		}
> +	}
=E2=80=A6

May curly brackets be omitted at selected source code places?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.17-rc1#n197

Regards,
Markus

