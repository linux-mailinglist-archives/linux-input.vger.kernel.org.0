Return-Path: <linux-input+bounces-13945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA0B2279E
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 15:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61058174A26
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 12:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3AF26B759;
	Tue, 12 Aug 2025 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="EtSD+vaS"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940A26980F;
	Tue, 12 Aug 2025 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003335; cv=none; b=BYLACB69jpW0rS/HBzgFNnZlEitLzSabnB6OHvQrQcI5WCmaRGFArQj9DzkyvTuHiTzykb34Kq5gZIPhKaDcQnxBCkMTRo8PkTQXjnNR9zfGcQwK4l739UrB3xx6DhpGUxMo/0oUc0XmY90g4xyz1eJcRCQ9IWOowqr/Sdyn6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003335; c=relaxed/simple;
	bh=TCnHBgiKfR2bV9FECNhKtqDNsmwR0H700W+72c48uEE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=A9A+iVUOd3aRn/JfTHrG/gTpM1HC0CV7Mv3eKMIYELsOj9kYqY0KWTmXegQD8CA67kE0eJEaoQGLAwTOQ1d821yD9z9H2adOG9ckp7uC5av2RztMavsDOSEa1hByGOFj6H0RolCcsPL4XBSzF4z3nGk420bQpmnAoLMGXZvREW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=EtSD+vaS; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1755003324; x=1755608124; i=markus.elfring@web.de;
	bh=wZgG4WM7TQCFX2yR3+Vt7rXgHAUFRqCpjQ8RHGWVr/Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EtSD+vaSpDAeVx13tJjZQSuPRSHMAJVC81KPfjY2p8p+QmIrSOZYV/TaeNVV5qLm
	 +dQkIK3usRsV9yA4BYoQzCQi0+mUvCZjRmNDi+NqM1LiieTLc9FgwDT6PQpCExBt4
	 ckmwur2F+0XlVI2x5F+e/cPMVSpKBDjSmIVdNxAiI8ii75npiJ1kLZrYct+ufeSTj
	 tW9eJq7FNMuAvqUIYsMjREGIkVbXIax1GdxpQgC3FkauUl0iOmeMfXCOoRLx99Y0g
	 pOcPrddqKZHsxLyiqHQk09omh8XxD8d9LZVGPgnK1CWWiuLS4LbK4I8RPjP/Yn7Sw
	 80yXdCpis7U8dmJfaQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.213]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M9ZZo-1uiV8y28bE-003WTH; Tue, 12
 Aug 2025 14:55:24 +0200
Message-ID: <3bc0b091-b23a-4245-81b0-da7e561cbc81@web.de>
Date: Tue, 12 Aug 2025 14:55:23 +0200
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
X-Provags-ID: V03:K1:UqXKl+VRYELIWKRB7+bBP1MjZXlb/3wEbxIG4oYkTi6xwEkTD35
 6mE2F1Y61NXi9e14Cx+HiggEYREj5RZIoLIKfIId5DEYNegfhbAY9AYQL6kdwppfuCWvJH/
 YLx1xOMvcc3XxSXUdTWRVPZHvwmbZwV8FiI3o4PsYiNzUcWAnnsTZJcDAzbest6KWULn7+E
 c/qujThNx8KH98xjikfvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JlEeAZZg9do=;Ryb21o3VpxzAwV9f7CV4nWF93v1
 YwpME2HUf+agPUV5NXiHo9+dwaVWEGKitz54sLM+CwTVFgmAVuazFtJa4P+joJBJFTIcQv0oA
 533MUXJLrWBLtDyFoYT7u5Kw52uHSWP1bIhOOOq48R2Gz/R+5/wAI2jFjSG6BiT5NPtSrr7yv
 ZzDdbK8b/Oxyn4oqpH6c4pDLfYDBTsoXCeKUowZh7BB/wofAacKvR6vf0uwOkdVy4+LjXHyjd
 6QuHPmtFwqELTnJrpHRWDV+cwyzVgpkQNoNWWuh7c9FosmxV4pVQf7EexuNulREoPtGoQ9/HC
 JBgfqwo+Pq+D3/iCnWMo0sBYQWQ0PnCtrQAuC3WW+jDn4lH3DNH0Okr5aHoU0j8alAEjrTTPe
 r2cj5kwoBfiN3/wwQKVLaZYPioEm12CLUztsyNGAm0fshg0tpVl0PS4nSW7joOyn7e3WhJNKH
 VEiE4kLYizTp+Ra/YbEpfQpaeQbtLlo6B6EOq0B/P6fxu1BIZUC37Oti4EniO8c0d/FyO0K4/
 iEUbSgtqqRRpuTO74LoJXZ4JwYq+58jpZsWzoT7bWWmhSWeyRHwpZJrA8/6pCzxBlJhmw8zHO
 sRsIiBu1Kewg20xjEMidGJmaq9fJM+ZEXMTbG01JSgw1GgjO9xaGkQqg6FExp55bxFBckouFX
 a3179Liiuv/zFDSJpNP/+dEEUwAJ7WeTEIUlgm+z5Ih2tCEpCypYAVK2X3IDMsQ4wmJYHIrrF
 fQ4tTm1q61X5eB5ln1HsdapuZT3lz8sCcXI88aZFDajq78J7XkR2onX2GRiDm9LVu6+ZZ9/W8
 jTRpNVWELlZ/X+KcGSj/k1JE8bhMkeeV4A1jXe3oEK0XSrTP2qt4y4qRYdTwBCqaeOFJNh2RJ
 AxRNsC4C0GTrPNi8XpV+yVWUekFFOKD87MlfAO9DU87JEvvq3EIZS8ZsInaktrKGoXcOUtArW
 JvKZ5mgur+PF3YlCBWeSIor9luogoXT4Hwo268v79BL/OcJ9IZ3WBDDp+hH8yg6xN0k+KEIRx
 63jDzA3FtMLMTsmuAqgDT3yY77+CHF/Itt2unXkPRxMtkSXyFGa96re58xl8d5+1jVwjXkjbM
 XQt18gihJpu9/L0mjlnSRQ9QjxmSj2ieH8lJ8WI6GkOO6zaF2i7/Bb2Dlj//wnJgknOeDFhao
 fUcNL6mMycJ8LAVFdNravrmxbgyZhHDBnLVEpMwvnEjEWHbGykrMG76lkLitLvBDY9rN3RjS0
 B9rRM8UAMc594hG1ZoeLUkEAcdVMHbAH5tHnl7iJ40KaZTqjgU6W81wtrovAoonArzy4pfcTP
 Y5HLUgl1TWXHWIiSY6y92Be2EXwBSrZVmjr1Noaav6tTNNHLUoYScv0H/+fkxjPGv7h/S8Tg/
 n88bippPabQOPLWw3XnvKtNAgj/+iPlkcIJtUTypa1aQUFHqWy9DfRRNRwUXtCkcITs4Swwme
 tEhEtdJmjoD79LV5a27oxefTp636topxWN5C+TRqDgAyFwp2wgD/V3bPbNfBXw/L7c81f5f7q
 RcmUMiH78B/PY/ED//rBXQIDp2L62R9dqaJ3/Pw32nLSd4u5zs+AZWx/pkxkBAWJsH3+9aWZu
 Umxb0NzlbeVZgSNG3q5K9JsHbKCB8a94si1HCb+ksuvacUDDDoZkMo6JyRXyBvuS08dE4xl8l
 jPdQafQ5FBPAgGFRr/DLJvYbb2Tm4dXJwEUNDu1IBgJE2DNwmULHrXr2oPEi8NIHzp1WLkn9+
 0lL4MkbGGj2cC5J99ntiJoD2uL4KXDeXQYV30RWJ323wvhcdAMjhLTii8ZmoqniY8lCYbYtjC
 u9tBjsNirJCKQSA3yCtm9jrNXqW2w0v/SaJEeJ+MevT8CRMlGEj/FqnOqMl0xJCjMNou0FTeJ
 3kpurO/FxlhmT6juN3alyjD4DPx2YXG7s9pJqxs+U5U7u+9vBCTrG4bDLgazunsERfLDsVKgl
 pg8zT8AwA2llsdfba3wjfpFGP3aloZ1CNbd1/7jBKIiOS6o8Cp2Ii2X3y/qqyd47U+bXmLzhu
 xAby7y0PunC4Yra6il52HtbpacHkF12bGvk4aC7uQ3RoaTJzV0SQvtLGtGSZLEfxtHjWPVYGe
 PzHIluJ7z413+o5vj8zsJU1D4I1dqyNZ+is/BRPsoPrLyBzkg97SllJrFa0QUfxdoAfcp1yt2
 krttuyQRF8/R14/wMVFQii8yIcEVmxRZ+lXT8pBWqGV+JIHX+3ikJIrKe1yDN6fTB4Czs4sqs
 A/L8T+l/NA34LkdJAf1mP2czWTBv2xVpVw7KVsazZcYrEblLDtAisdGcE+Sy5Zzmz/dz/loF7
 dHC1O2p229116Xr8pBmfO07JuxnuhDt/8UOBpz4PsW5EilFAqMp+W1yjDDeRsHNbt8Ia67oCJ
 aIA1NZRQD8Zi17QjYPDY6Yh3H5AAjvcdNVBoAy9PdhZtCEXolw8rkWHi37hg+xy5vmn/p8Eum
 JGp0PqZUsiI5E2xPuDGyR98xk8Bo/yOHWbPFBT3uZL45jz/i7i70B71u3ULO2/jIX692/vMVp
 K0d19X8XHTVrkKCojuYoW/lcVm3EmAu9bwq+XTaxfNJ+ePQxkccgDtg++KBu6pgHgU7K4oDhp
 4aEdTBk/tkAoCVXEAD5BJ2iUt1RYbGaYlB/LKqrdtUjCHCX1HmcGFZRYLqsY2doLpBmBU9s7+
 2vXE5Btf6ye1pkmhduVjUCsOMrTlZsG9T/tI9J/opSr6LjXGSQkm5s6Hr8jYr5Q2Tds+8WJXO
 AjQzxJ6MzLNPJCeLpam2v8COxRdGgbATqeSjogJp+OTLdcmxc8R5I5Osp1gQXbIzrEO0sjzIO
 d4BXlrsgR8eRqWUCitdZjeRSDOrvRopcJQBsIdPxOKexTCyjYuf+ibvolhMe0uqLKZjAS5lDY
 OwYbU/fGhBDCUOKOLcB1aCELQ+9nfqHpecaAsW5J3ernvDZhbm9XulcOsZqf49iUrH7HjLHCy
 8Mmum2jjTtrcoYbBpkGuoXu4/Q8OahdiaB1XDutuxePChqxkP2ELbOZ2XWNvJhT8HT6O7+icH
 V6CeBmfc+/UWrJTU+Ga08s2yT9u+AQr1zd8qcfF1qAyjEeS8JYiYulnFArqMD3Vihui8hLkVt
 SvmuEZqVJYdPvAsStX3adTgYMx/VFaDClXn0eA80N+OUN+j3UwTEb5Pko8SxdcS5u30ZSN9Aa
 /D/qZerptgS4+ys9PzKyxWp39J4pbpgbHzBpeev3lecBRMcEPKSsQVcevV3dQlZpc4hakydWJ
 i18h1fbeToMczyatqcmjy/K57J5W4VBjpCN2kJKBVmkEsLzPvv0x5l1IYFrIH+mc9GHJihk42
 w2HtzZCceaTD4W6x2ASBBbBtlkdMoBZXDkaX26gerl8TIrNL56FGXOzkMJxQjJ3FKckGOwg2U
 aFKxk8rO18iczTj2JwtWEkVUIW5SQl7s1j+jrPsnZnrji8DYRNTWIzy0Hj18e5ElgEOusZ1gz
 dDKt08pbOiDoxl6gf8cYLxkdZ2pIWYgg=

=E2=80=A6
> +++ b/drivers/hid/hid-lg-g15.c
=E2=80=A6
> +static int lg_g13_get_leds_state(struct lg_g15_data *g15)
> +{
=E2=80=A6
> +	for (int i =3D LG_G15_MACRO_PRESET1;  i < LG_G15_LED_MAX;  ++i)
=E2=80=A6
+static int lg_g13_mkey_led_set(struct led_classdev *led_cdev, enum led_br=
ightness brightness)
+{
=E2=80=A6
> +	for (i =3D LG_G15_MACRO_PRESET1;  i < LG_G15_LED_MAX;  ++i) {
=E2=80=A6

Please reconsider the usage of double space characters at some source code=
 places.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.17-rc1#n234

Regards,
Markus

