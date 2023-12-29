Return-Path: <linux-input+bounces-1055-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E731820215
	for <lists+linux-input@lfdr.de>; Fri, 29 Dec 2023 22:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15BD7B2141B
	for <lists+linux-input@lfdr.de>; Fri, 29 Dec 2023 21:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0688E1863C;
	Fri, 29 Dec 2023 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMiSGg+4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110F182BD
	for <linux-input@vger.kernel.org>; Fri, 29 Dec 2023 21:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2331e7058aso862568566b.2
        for <linux-input@vger.kernel.org>; Fri, 29 Dec 2023 13:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703886616; x=1704491416; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddjhfTn/rvdPDKg4fl+g7WDUyDRxOhegf3NCh6vqWwc=;
        b=HMiSGg+47dhHUt785LNUxsyx0kQYwkYlGFb95yNmQZlo0CFwCZJ10fivxbgzSMX5/r
         QBtDaT8VlzewzvAyEK4QMM713Li0VefXgsJLRv6jgN7+Xbx9zXxh5NxKFgwe3ejJA0FW
         v+PO00HVPMK4xY0nDzS+sAVWgo8FQycmqyX2EtaE7Vf/L6O0V0luKqQXwt0UbPQaJWs9
         Dn7dIv6TAn2tyGtnJHvPMAiFJmSmVWhXkIUN2t40AeouBsl2i9uq3kqO6mGx3b8PTdPA
         e6VkG5flfFsOFJMrZ26tpEcyGUb/L3GavA7DZn3vNMz3MLausnbts4sWobIlXYTMH56E
         nw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703886616; x=1704491416;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddjhfTn/rvdPDKg4fl+g7WDUyDRxOhegf3NCh6vqWwc=;
        b=uV3hHG0IAgAectitfTqaqytZWyr+0pu5GAjspmLxd9auqbjYRyP7f0qPgX6xvis7EO
         JkCKF52FrqJznUxscrCMvueR6p0oW3MznePByIKEG6STUuv6zQTayGIPBEBfSqAl8eil
         QKsaApaNuyh17hG70Q7KVgzZpsexx9hSWkDhIGCKlZ3A1IBaqBAooi3pFdm8IDDtRKbt
         y8Mipq8/rGJLAzEDL4YMU6hBLQDPi5uJ5NuseRJb4S757qzG9bB6T57WAtQbOtfOpwWk
         8cXcnwE2wOTYnC9vTOnovLOgv7D/R2lp6IOjHvZxfxEZXMLbiDhiMS9G0sBAUgBe4tjT
         7XZw==
X-Gm-Message-State: AOJu0YyqJUr/SI6iBiyNEPnv4WZ7o1pB53ZWoFyb2z5noavngl7QhqRX
	FPNe/f9kOImRbKvcLWMJfWnin+D+nDe3tnMpKxRSOLUj
X-Google-Smtp-Source: AGHT+IGJuFRQQbzYCTEK1Oe3mCDDKniCfxkKTDRGFC4TTCblLZ/w1DbSHwDw5qSMqjfe8f83wzTAI+Bjkc6GrytPtYg=
X-Received: by 2002:a17:907:1b17:b0:a26:eeaf:8a8a with SMTP id
 mp23-20020a1709071b1700b00a26eeaf8a8amr2969416ejc.252.1703886616285; Fri, 29
 Dec 2023 13:50:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231229175737.edjdf6c5mfrsyyt5@jekhomev>
In-Reply-To: <20231229175737.edjdf6c5mfrsyyt5@jekhomev>
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Fri, 29 Dec 2023 23:50:05 +0200
Message-ID: <CAKWEGV4TTnFJe9tDOwKC7GSS8h048nKphEg+c2RnrHmJsWgs9Q@mail.gmail.com>
Subject: Re: Fixing ISH hingle angle sensor invalid value
To: linux-input@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm,

Second challenge is to detect if the angle is valid et all: if the
hinge is close to vertical, calculated angles are changing in all
possible ranges. So, re-implementing this "virtual sensor" in
userspace using accelerometers seems to be a simpler way than trying
to fixup invalid data that arrived from the ISH firmware.

=D0=BF=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 19:57, Yau=
hen Kharuzhy <jekhor@gmail.com>:
>
> Hi,
>
> I have a device (Lenovo Yoga Book tablet) with a hinge angle sensor
> exposed by Intel ISH. This virtual sensor should compute the hingle angle
> based on the accelerometers data. It is supported by the
> hid-sensor-custom-intel-hinge driver.
>
> The sensor has three channels: angles of base and screen with respect to =
the
> ground, and the hinge angle between them. The base and sceen angles are
> reported right, but the hinge angle is always 360=C2=B0.
>
> What is the correct way to fix this? We can modify the driver and fixup
> the hingle angle value in it, or add such quirk in a userspace apllicatio=
n
> like iio-sensor-proxy (this requires to have a blacklist of devices in
> userspace apps). Should we try to correct the value of this sensor or
> just blacklist it and re-implement the same functionality in userspace
> based on accelerometers data?
>
> When fixing this in the driver, we should decide how to distinguish
> 'fully open' and 'fully closed' states: we may need to check the lid
> switch status for this.
>
> --
> Yauhen Kharuzhy



--=20
Yauhen Kharuzhy

