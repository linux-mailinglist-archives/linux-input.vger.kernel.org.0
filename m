Return-Path: <linux-input+bounces-15879-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8DBC310C8
	for <lists+linux-input@lfdr.de>; Tue, 04 Nov 2025 13:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8D181899770
	for <lists+linux-input@lfdr.de>; Tue,  4 Nov 2025 12:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8FF25F99B;
	Tue,  4 Nov 2025 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=aegee.org header.i=dkim+MSA-tls@aegee.org header.b="rarn6MQw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.aegee.org (mail.aegee.org [144.76.142.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008F82EC0B7
	for <linux-input@vger.kernel.org>; Tue,  4 Nov 2025 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.142.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260561; cv=none; b=CB2HSMkFwhp3HJU+9w0wEf/Yy0mmGXgaQtuhYLXqDSJNLlgk11I7CNL7s6ruwBQfoV7qxH3EyVdeZ90nvpBitXTlDE+rc7h61Ycg1y5UBdX9gRf1FeJEZewb57j7qjTQk7QlNMo3zWFOlDGvftKmN8ERwLlo64+xGnPVmhdBf5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260561; c=relaxed/simple;
	bh=tCFJDQ2qbHgKGOTP00PczzKvCX0ehvtOki7u2G8sL18=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=qvmEJ0LxprGVFrWbtplQkHOOs/0Nt8DIEycWQ5QFXeTCz8+evE2qJUnG7Tj4K5XeoXtJWu/dEtu55nyNSSk9uxVnB0BzUaTivSAFlSCbscbtc1g1kUoecqEwEBFt8bOWq9z1iBsYOypQTPSHRjrDoXcRaBfGJ0qxEeogT/WxcYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aegee.org; spf=pass smtp.mailfrom=aegee.org; dkim=pass (4096-bit key) header.d=aegee.org header.i=dkim+MSA-tls@aegee.org header.b=rarn6MQw; arc=none smtp.client-ip=144.76.142.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aegee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aegee.org
Authentication-Results: mail.aegee.org/5A4Cmttm1855554; auth=pass (PLAIN) smtp.auth=didopalauzov@aegee.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aegee.org; s=k4096;
	t=1762260535; i=dkim+MSA-tls@aegee.org;
	bh=tCFJDQ2qbHgKGOTP00PczzKvCX0ehvtOki7u2G8sL18=;
	h=Subject:From:To:Cc:Date;
	b=rarn6MQwsDAuBpx31zhWHG67F4HmbCsusRJ+I2NNsK+i4Am5fEXq9zj+kqmuXG8u7
	 NjQFAsJLmyxke5mNXOH4JmkK+x1/Q66vWnsE5ebpwoJg0nwJdPpS37zUSdcvVqdklg
	 RlbCDBAdP31AiM8MrIA/6ZTPp1rc7kj/tsi1gIU3rk5UuDSaqYrSjtaTFlS1I5YLcu
	 qEOn0kJkHqNa29LJ1VbDJDn41y6PQPSuQBGptjoodpc6ORmvDP4A7p4prs8jF2JXWM
	 hNmWcwgP3+DKauVFm38RB/bFtE8Qhx+qdZhTrTpLaay9weR1i716uFz0MwvTbQlI6u
	 8Lsz+tNSQkUGz6KlzbR0VEQS6mK4xsOEuQFBb5evJhA9NVPAUsz4cvyyyRx/ncqWZn
	 uPwlTPrE5X2vn1o04zAsvHApgjty6Rk3IzUSZwcmMZ0pta8THXdmBsulL3geVnd1ej
	 SNDps2dhFkpRNxKq4kX+2lvVftJSVhZFEVrq5ln8z6IgDgiCd/3OAYB7s5WGvSEIg/
	 7YDUo91HlXXzsMRDcNmWTTukll7a2pIspBD8bsWlQTcWTkzeMFK3wdPqaVHpikfhti
	 FJYvJ77H1X2zd7Wrm3PLp51+Y9det7ik+kxoohSFwFBDlnsMaU+Po0H2YA6qP4x/5t
	 z0Ktmme7I/e79HLty4rcLOXA=
Authentication-Results: mail.aegee.org/5A4Cmttm1855554; dkim=none
Received: from [192.168.0.242] (95-43-114-153.ip.btc-net.bg [95.43.114.153])
	(authenticated bits=0)
	by mail.aegee.org (8.18.1/8.18.1) with ESMTPSA id 5A4Cmttm1855554
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 4 Nov 2025 12:48:55 GMT
Message-ID: <24eaed9105633d03eded13e11c5a994bd93a81aa.camel@aegee.org>
Subject: ioctl handler of the hidraw driver should return ENOIOCTLCMD for
 numbers it does not want to handle | tcgetattr() =?UTF-8?Q?=E2=87=94?=
 ioctl(, TCGETS2, =?UTF-8?Q?=E2=80=A6=29?= sets errno to undocumented
 EINVAL/22
From: =?UTF-8?Q?=D0=94=D0=B8=D0=BB=D1=8F=D0=BD_?=
 =?UTF-8?Q?=D0=9F=D0=B0=D0=BB=D0=B0=D1=83=D0=B7=D0=BE=D0=B2?=
	 <dilyan.palauzov@aegee.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org
Date: Tue, 04 Nov 2025 14:48:54 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.59.1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello,

With kernel 6.17.6 on x86_64 and glibc 2.42 the below program substitutes t=
cgetattr() with ioctl(=E2=80=A6, TCGETS2, =E2=80=A6) and sets errno to 22 /=
 Invalid argument / EINVAL.  The only difference for kernel 6.6.60 on armv7=
l 2.26 is that the substitution has no 2, tcgetattr() translates to ioctl(=
=E2=80=A6, TCGETS, =E2=80=A6).

For tcgetattr() only errno EBADF and ENOTTY are documented at https://sourc=
eware.org/glibc/manual/latest/html_mono/libc.html#index-tcgetattr , at http=
s://man7.org/linux/man-pages/man3/tcgetattr.3p.html and at https://pubs.ope=
ngroup.org/onlinepubs/9799919799/functions/tcgetattr.html (Open Group Base =
Specifications Issue 8/year 2024).

In this concrete case changes to the man7.org documentation must be trigger=
ed by the Austin Group - https://lore.kernel.org/linux-man/dsb6oiv7q7ra3gbu=
4bovy3gah522lgsf3d6h3wxwe4ieuka6fh@g6u5qzlyoxf5/ and but https://sourceware=
.org/bugzilla/show_bug.cgi?id=3D33597 suggests this is a kernel bug.

For hidraw devices the possible ioctl commands are mentioned at https://doc=
s.kernel.org/hid/hidraw.html#ioctl, TCGETS and TCGETS2 are not among them, =
so I was expecting a ENOTTY error.  This problem might also happen for to t=
csetattr() - I have not checked it.

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <termios.h>

void main() {
  int fd =3D open("/dev/hidraw0", O_RDWR | O_NONBLOCK |O_NOCTTY);
  struct termios s;
  errno =3D 0;
  int ret =3D tcgetattr(fd, &s);
  printf("Returned fd is %i ret is %i errno is %i %m\n", fd, ret, errno);
}

The above produces:

Returned fd is 3 ret is -1 errno is 22 Invalid argument

Kind regards // =D0=94=D0=B8=D0=BB=D1=8F=D0=BD

