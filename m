Return-Path: <linux-input+bounces-13382-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD812AF9796
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 18:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8C741CA4C42
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 16:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E92326A72;
	Fri,  4 Jul 2025 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hughsie.com header.i=@hughsie.com header.b="kjGfq663"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A54D31552E;
	Fri,  4 Jul 2025 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645326; cv=none; b=pgheE44ShAmQUVupi0V5gqUstXnssYI7Pr542SSoRFJO4rqGTMdfwHrXDSPwI3tjySXiqEl7qy+EzV8oyd7NZZYN7T7WwNzdba1WUAhu3Dk/gs7NR8dbf3l3U4uoyMVpXQujigsv3CwQgrYwg2k2nIHJXXnBZ2LFLieATT1k0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645326; c=relaxed/simple;
	bh=GE/Og/mVqKuZmTQkxcvnThWPrBLl3dQDY0YznXO1Qmo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCmiTPWpB9tPF5o69nbR1R02Al8cUX/fa4tgYnqtiwjEqrbVovkgmyPZIALqTap5eR336pfj/NV5QMjmFT6+gClydxX63Z7wIbr+7X3j4IGQhT5R+V079obaaDUrMIjBKzYG3pWiHsn/bhCdydZ4+MQ6O2OC+BiQKhWO9SFHRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hughsie.com; spf=pass smtp.mailfrom=hughsie.com; dkim=pass (2048-bit key) header.d=hughsie.com header.i=@hughsie.com header.b=kjGfq663; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hughsie.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hughsie.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hughsie.com;
	s=protonmail3; t=1751645305; x=1751904505;
	bh=GE/Og/mVqKuZmTQkxcvnThWPrBLl3dQDY0YznXO1Qmo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kjGfq663Kt4+EFtt9RSWyzieaAnp/urPyyra91xY1AxCSz4sOXXIUEOh7H0td0TgF
	 MJiqE1TuEyLZW6YRGiLgwkM9itDw2WMzo+J/TcCtoqKE78JWwDaYDBIqeMSTt5Dboa
	 iLNvgBbpHNAVW/4XmD/BNB6jfaVnVLVCZzMOBJK/wh9vV8cCIF53ZJfA4I4CUW/um2
	 BmX94QbCN+fVtuxqOOi7UVLiL5zDE8P1fVi35ogmd8V/t6TuOdQ9ldFrvS0ayWLQJF
	 1D6Zo6F9Z4fp83TWFVhX+k8Sqf91JR9Xzu8kQqzmj7DkmxfQKA5+rFecwtk4bP/0cW
	 TICGf7NrGEVEA==
Date: Fri, 04 Jul 2025 16:08:22 +0000
To: Mario Limonciello <superm1@kernel.org>
From: Richard Hughes <richard@hughsie.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, "Derek J. Clark" <derekjohn.clark@gmail.com>, Richard Hughes <hughsient@gmail.com>, Jiri Kosina <jikos@kernel.org>, Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] HID: Add Legion Go S Driver
Message-ID: <Md8ia1ZjpstTm9kuqiUEtIwdxPZxV00hZMofLzz_UeUt6wVg46xETQH8h7PdQ2awHOuyPRjrDVw2f_dg4N1pXPHmnnzHM-2_IACD7fRaxlk=@hughsie.com>
In-Reply-To: <098ab194-f678-4e85-9e35-f8339c2551c7@kernel.org>
References: <20250703004943.515919-1-derekjohn.clark@gmail.com> <j3isljjyd6rlddlhpp7knxgss2mpr4ft3pcx5lc7r5r4bnnzpw@wjr6brfv2hsf> <098ab194-f678-4e85-9e35-f8339c2551c7@kernel.org>
Feedback-ID: 110239754:user:proton
X-Pm-Message-ID: 805ec186aa02fe35278ac8fb98ca4dff6e7e7271
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, July 4th, 2025 at 2:58 AM, Mario Limonciello <superm1@kernel.org=
> wrote:
> If HID_UNIQ is the right way to get the firmware version but some
> drivers encode a serial+firmware and others encode firmware that's going
> to make for a very messy "generic" property to read the firmware version
> of a device.

I think I've also changed my mind on HID_UNIQ -- IIUC the whole point of HI=
D_UNIQ is to be unique comparing devices with the same VID&PID. If I plug i=
n two identical devices with the same firmware version then HID_UNIQ would =
be the same -- so I think HID_UNIQ should probably always be the serial num=
ber. I think HID_UNIQ should also stay the same during the firmware update =
too, so we don't want to jam two things into one property like "HID_UNIQ=3D=
serial:1234,fwver=3D12.34"

Certainly exposing the firmware version as a HID property makes enumerating=
 devices much easier in fwupd; the kernel driver often just knows the firmw=
are version already and for userspace to re-query the firmware version usin=
g a per-device custom protocol seems pointless at best and dangerous at wor=
se -- given we're typically doing a SetReport and GetReport with no sequenc=
e number available.

I don't have much to comment on wrt the implementation, but providing a way=
 for the hidraw kernel driver to export the current firmware version up to =
userspace makes a lot of sense to me.

Richard

