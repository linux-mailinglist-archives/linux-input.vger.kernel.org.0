Return-Path: <linux-input+bounces-5706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E25957F46
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 09:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87FE8B211EA
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 07:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53323149C5B;
	Tue, 20 Aug 2024 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wDMxH9B9"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75618E36D;
	Tue, 20 Aug 2024 07:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724138526; cv=none; b=k+GsD4XJmkrWsta4SAycs32WhcPE8wDEmJOtlBxNMVyJTmX+girEi1mFKzQXQyBZ09UXAVd/djw49BN4xxbKq6Rcre7wypwvEu0QP4VKXC7KdYk7BMaaMCLOwHO3ywx1vGZRTMUsTcae1M7E38MdPJpFzSXgha4Es7lA5vCGVe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724138526; c=relaxed/simple;
	bh=1BUozcEWfgQZ+KdPlrQWUrtXZ3tJ34vzoXdYunpPaTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouqOpvHftbHFX22YUjKG24XBD8sQFzGuHJw6boyP529rM73nU4J8UrNSEaquLa+sxXi6VfP8obGRLOKFDB8kld3otNQ3LzzC60z5SG+Ar5dmKn5COXUlDAaNREQfmvmh6dhuYvjjb/bSeYak9A3DTBkrraKaUNh2WzyeFBdo/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wDMxH9B9; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724138511; x=1724743311; i=markus.elfring@web.de;
	bh=4eRNJiZiepI2514EsLWCsocatXLAAh5RemIIL/ANUNo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wDMxH9B9EPOV3MrVMCGfdR9L+OTELB2iE5x4lMvDtPQWrbQHH/hBFULJgi0/wuPD
	 rdWOH12LyEfXNq/Ar3mTY63wR2MbLUI7QvkOyrKncqzwbk8spKLvlrmXi7YpYTirF
	 SM22dJed2Cy/BjGRPWIk119plXbyXs+9pmCIaJdbMIlWI/X8KXM3CCqxVxHG2swwn
	 QPidV157BWYWUXfcat7gQiXBknnKceW4wao+ybWXgcJnTsr7G3bbOD3/QAxmZibyK
	 KSgKWhTryIrDuWgBW3t0ghV6mH+vyeeLnPOS9jZD57ZKbOvfOY/EunziSy4j3V/Ho
	 l7WlsJUKC4EJlRMnxQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MoecF-1sMz4w0bCz-00ZmI4; Tue, 20
 Aug 2024 09:21:51 +0200
Message-ID: <577e96df-5535-4530-ac62-edc53881a443@web.de>
Date: Tue, 20 Aug 2024 09:21:50 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: corsair-void: Add Corsair Void headset family
 driver
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RxBDSm2bAjWw9MUt7h27DhLB6rK2rmz9WjyH2mhS0AnebpGRls5
 c+ac3YlzdIzs0mR4Q2zG6xJEivOV7aQvU6SzR3mKzuX7YlS06/ySiHx120m8bdSct5XbuX5
 41CmphS4MS8GA7chcIN+od9H9YAxhrKtAoewoZnXZvCLmSjFCiWXnynT/v98velJ1vTYmzS
 e/ZD5dC8t6pklRqt3Fjiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5uSCuaLLpp0=;9qVP4j1PRUMIJpDU0GvzUjw3F3W
 4Bav2WiZZnEbnEzZa5j6vAiKSQK88BxuuJMzyT0DnMW9ZMM7hl2yRHMUD90kWvYZekvPlUZzy
 OG7sGpvn53b/sl0f3ftGczLj74Pz2cGWseZps18Vp3HptKuOygggILyG/mz3zYvSPNg0JzM72
 CmI6a4h17RbJByJ/+6s/7jMl9N1kV+Kt+Hew4EhHQyFfkjlGnxL7xGuh1kWaw3vLrdAPaACA0
 nS3jr2N/DSbV5SNcaSgJ5jdsKE0mvidR4/Z1EDOddukanpDQKpIB+wUsMAuCQQuQLTW7QYKAR
 X5wNPgl+RIPr0eNbYWh44nPqhiveUKDKs5lORyuJboCbUn8HvowQKEWQZsSHa5YhYib9IpR7I
 IIJhOpDRYSXfc4ZLPIly97qYbK/LE8tiwE5dIcInXiIgZsMnCF+vOJ/pAT3Xq1uwpQr2xkUp/
 8zbO634MzUT4x11JvFo7WVHXBgfFP5AfUhQW6j282Z1kdwpger2EyFvhs1ctru36PDYScftJc
 ykKcvPcZY+4WikO09v1ejNXfwdSUWk1hriZHLeh0Pm/aYPPRoMFZOzzjW8jTPziMmGZoABwYu
 cDgpAMKF3QppbiOJrtbaXMt42f4oRCrqTsdcKOtcNVi1nWPsiwY53+qeeIZSiGzRc0A3mEGtC
 Gxy4HkTeIOJQQMnm8Oy6hpK255XZksuGiCFGQ0EzACiKANbdxhOP+Ek8rG5XKHar6fb3MOWgN
 o5je/t4j3SaNl+6T/mEQm241bMHNEOkPWR5KSwFkT8S5bBehO+VO0lhn6+ni9jr8mhNWQozM1
 nFAHK/WmtPJbYonP47Yo9zSw==

=E2=80=A6
> +++ b/drivers/hid/hid-corsair-void.c
> @@ -0,0 +1,842 @@
=E2=80=A6
> +enum {
> +	CORSAIR_VOID_BATTERY_NORMAL	=3D 1,
=E2=80=A6
> +	CORSAIR_VOID_BATTERY_CHARGING	=3D 5,
> +};

Would you like to choose a corresponding name for such an enumeration?

Can any other data type be reused for this purpose?


=E2=80=A6
> +static ssize_t send_alert_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
=E2=80=A6
> +	if (ret < 0) {
> +		hid_warn(hid_dev, "failed to send alert request (reason: %d)",
> +			 ret);
> +	} else {
> +		ret =3D count;
> +	}

Would you like to omit curly brackets here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.11-rc4#n197

Regards,
Markus

