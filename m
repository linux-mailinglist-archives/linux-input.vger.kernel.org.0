Return-Path: <linux-input+bounces-1405-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06B838E3D
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 13:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786991F24424
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 12:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695275F848;
	Tue, 23 Jan 2024 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abaltatech.com header.i=@abaltatech.com header.b="N5n83pPV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DD35F847
	for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706011978; cv=none; b=rQYavL+LCB5qkAdUpj7tUeoRwQCJY0Rc3G+G0+XszxtiHxPK0VaBHvzm5136aF8VTGPfn/dV5QgHeyt+u+sOOdDjenjJzlo+B694JTc6T4F5s2TQq9WYPfqEkKzXdlk24Jl4DM796Ud/gauA5DLaZtyq4r9S4IX9pdCCGrz3IQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706011978; c=relaxed/simple;
	bh=vMldsinky1rVpaNwFY0gG9MCqB/gB8cA9ybdUTlUO6I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Lu7fbyHhsoQX4VNIBlnWs3sdhtaC78YbuqUQx5goiZJUNNhpwDPkTBEAi++BifcpMuCPQYleRndWjfMbYNjw1YPaC16dHPuUzG7KlTbDxwtEPsjIsRkDrRV+FsfXCcUeSvj8Plpq7X8TGEyAznw3o9NBmausm6dV0MiI1EWD/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=abaltatech.com; spf=pass smtp.mailfrom=abaltatech.com; dkim=pass (2048-bit key) header.d=abaltatech.com header.i=@abaltatech.com header.b=N5n83pPV; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=abaltatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abaltatech.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-21499c9650cso23577fac.1
        for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 04:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=abaltatech.com; s=google; t=1706011975; x=1706616775; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sHWR5m8Uu7F9bztAS6YReTZBQxh622FSfp7ym8cmJYM=;
        b=N5n83pPV9GJdHpMs5wSi+IPeaPAzMWiLhaezjCgLanQeOJUH/lf1IM1yy5xYD5cnKg
         3SQqc+mNQKZe1W9DG+J1vyTca9OfX5XmCjv5LebzIIyMW9hM0BDrH7SqIU6btRci3QgH
         /PJYP9SmHTXNMyo7NMc8LbY3+VQKSRvrn03F0Njv1rWxH+S4Wd+8c6a881NeYwh53UQK
         +3/MOtH6wcBt2UJYvuJI2Yl9jpMs/WWuxd+CB3K1ChXiRMF99N+UQSAsq5ANL0ryTLHE
         5roWGJTFY3FSsnoRCl/+AbspJxWCIH24nHFKEpyPnIlcEN9dZP+LSgbSe++rEBjY21Sj
         79Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706011975; x=1706616775;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHWR5m8Uu7F9bztAS6YReTZBQxh622FSfp7ym8cmJYM=;
        b=iTynJQjjHzeBvCd9quPEXuEvbbBWtmPSKoHy2Vt4mg3/OFgsP30CFP3NHMK7RR9Lr1
         7XgyhLAhId4YRlmf/Ixt5lutpr3TuuUsDbD5HXlocd92WhOCeOYxIZ5V9wbolZN8QFmy
         +2FZ+Bn6LaL0hW8EoWWBUPDfTq2YlVCoE2kg5XQO/G1LQ3LzmBVNOgsMTLleY4kM94Z+
         W3yp/pp450gJdPCyVewPy4yuWnpsFVhAVmh067oGgWC/Ae59L8Qw0PaZhG7pFl4fnPGy
         SMhJeYUERpk2hzep4BR0j+znXf+cnXKfSIdsaZ+GWnP9r69Z+YlM2UOoAHoiqguD+DCM
         j/FA==
X-Gm-Message-State: AOJu0YyZSTF1CEwcfTRivV3vd6KdxMT7xfrV4SfXRGpuGTccLjuRAN19
	pH+RDm6u6wMxHeQfASEcQcjFX6H3Et3LjMThEJqagHyE5XMym/5qvGJx2nO+41p8r1n17KLc1ub
	4adKQaT7hXrzHqqbbx+wuU91j09KG78kgWfu0uSEQ65n3VC5+tw==
X-Google-Smtp-Source: AGHT+IFFYNQDM5ZHe0pTjkdgEkvDU+X8sD4HbOPaFtjrpmqNmSQ7umol6DRnm2nwAzBsl/RikWomIWcEIxeRWXwN5zg=
X-Received: by 2002:a05:6870:9a05:b0:210:ccdb:7cb0 with SMTP id
 fo5-20020a0568709a0500b00210ccdb7cb0mr1164663oab.7.1706011975677; Tue, 23 Jan
 2024 04:12:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lyuboslav Angelov <langelov@abaltatech.com>
Date: Tue, 23 Jan 2024 14:12:45 +0200
Message-ID: <CAL5USX=a3VwaBp6LUOKks3Wr8eW3Ucpc0y98yhqCGez2Y=JNEw@mail.gmail.com>
Subject: Multitouch HID issue in Android 14
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear kernel developers,

We are reaching out to you to discuss and hopefully resolve an
important issue we=E2=80=99ve encountered in the recent versions of the
Android kernel (for example 5.10.177-Android13, as reported on a Pixel
7 device), which affects millions of automotive multimedia devices
already in production.


The issue we=E2=80=99ve detected is related to the handling of the HID
descriptor by the kernel. According to our investigation the issue is
caused by a conflicting interpretation of the =E2=80=9CUsage Page (Button)=
=E2=80=9D
and the =E2=80=9CUsage (Touch Screen)=E2=80=9D feature items in the used HI=
D
descriptor. The issue is noticed when a registered HID descriptor
contains the =E2=80=9CUsage Page (Button)=E2=80=9D feature item, which when=
 parsed
later on in the kernel, leads to interpreting the device as a
mouse-like or trackpad device, ignoring the value of the =E2=80=9CUsage (To=
uch
Screen)=E2=80=9D field, and manifesting a mouse cursor. Previous versions o=
f
the kernel correctly handle the value of the =E2=80=9CUsage (Touch Screen)=
=E2=80=9D
field and identify properly the attached touch screen device, hence
our request for fixing the issue in the future versions of the kernel
and for the affected devices already in the field.


This issue does not reproduce with =D0=B0 Samsung device with Android 14,
which reports kernel version 5.10.177-Android12.


HID Descriptor overview:

static const uint8_t c_descriptorArray[] =3D {
  0x06, 0x0D, 0x00,  // Usage Page (Digitizer)
  0x0A, 0x04, 0x00,  // Usage (Touch Screen)
  0xA1, 0x01,        // Collection (Application)
  0x06, 0x0D, 0x00,  //   Usage Page (Digitizer)
  0x0A, 0x22, 0x00,  //   Usage (Finger)
  0xA1, 0x02,        //   Collection (Logical)
  0x06, 0x01, 0x00,  //     Usage Page (Generic Desktop Ctrls)
  0x0A, 0x01, 0x00,  //     Usage (Pointer)
  0xA1, 0x00,        //     Collection (Physical)
  0x06, 0x0D, 0x00,  //       Usage Page (Digitizer)
  0x0A, 0x51, 0x00,  //       Usage (Contact ID)
  0x16, 0x00, 0x00,  //       Logical Minimum (0)
  0x26, 0x00, 0x09,  // Logical Maximum (9)
  0x95, 0x01,        //       Report Count (1)
  0x75, 0x08,        //       Report Size (8)
  0x82, 0x02, 0x00,  // Input (Data,Var,Abs,No Wrap,Linear,Preferred
State,No Null Position,Bit Field)
  0x06, 0x0D, 0x00,  //       Usage Page (Digitizer)
  0x0A, 0x42, 0x00,  //       Usage (Tip Switch)
  0x0A, 0x32, 0x00,  //       Usage (In Range)
  0x16, 0x00, 0x00,  //       Logical Minimum (0)
  0x26, 0x01, 0x00,  //       Logical Maximum (1)
  0x95, 0x02,        //       Report Count (2)
  0x75, 0x01,        //       Report Size (1)
  0x82, 0x02, 0x00,  // Input (Data,Var,Abs,No Wrap,Linear,Preferred
State,No Null Position,Bit Field)
  0x95, 0x01,        // Report Count (1)
  0x75, 0x06,        //       Report Size (6)
  0x82, 0x01, 0x00,  // Input (Const,Array,Abs,No
Wrap,Linear,Preferred State,No Null Position,Bit Field)
  0x06, 0x0D, 0x00,  //       Usage Page (Digitizer)
  0x0A, 0x30, 0x00,  //       Usage (Tip Pressure)
  0x16, 0x00, 0x00,  //       Logical Minimum (0)
  0x26, 0xFF, 0x00,  // Logical Maximum (255)
  0x95, 0x01,        // Report Count (1)
  0x75, 0x08,        //       Report Size (8)
  0x82, 0x02, 0x00,  // Input (Data,Var,Abs,No Wrap,Linear,Preferred
State,No Null Position,Bit Field)
  0x06, 0x01, 0x00,  //       Usage Page (Generic Desktop Ctrls)
  0x0A, 0x30, 0x00,  //       Usage (X)
  0x0A, 0x31, 0x00,  //       Usage (Y)
  0x16, 0x00, 0x00,  // Logical Minimum (0)
  0x26, 0x00, 0x40,  // Logical Maximum (16384)
  0x95, 0x02,        //       Report Count (2)
  0x75, 0x10,        //       Report Size (16)
  0x82, 0x02, 0x00,  //  Input (Data,Var,Abs,No Wrap,Linear,Preferred
State,No Null Position,Bit Field)
  0x06, 0x09, 0x00,  //       Usage Page (Button)
  0x1A, 0x01, 0x00,  //       Usage Minimum (0x01)
  0x2A, 0x08, 0x00,  //       Usage Maximum (0x08)
  0x16, 0x00, 0x00,  //       Logical Minimum (0)
  0x26, 0x01, 0x00,  //       Logical Maximum (1)
  0x95, 0x08,        //       Report Count (8)
  0x75, 0x01,        //       Report Size (1)
  0x82, 0x02, 0x00,  //  Input (Data,Var,Abs,No Wrap,Linear,Preferred
State,No Null Position,Bit Field)
  0xC0,              //     End Collection
  0xC0,              //   End Collection
  0xC0,              // End Collection
};

struct SHIDReport_MT
{
  uint8_t m_touchPointId;
  uint8_t m_tipSwitch;
  uint8_t m_pressure;
  uint16_t m_posX;
  uint16_t m_posY;
  uint8_t m_button;
} SHIDReport_MT_PACKED;


Thank you for your time!

Best regards,

Lyuboslav Angelov
Software developer
Abalta Technologies, Inc.
langelov@abaltatech.com

