Return-Path: <linux-input+bounces-2384-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B530C87CAC5
	for <lists+linux-input@lfdr.de>; Fri, 15 Mar 2024 10:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E124283EDC
	for <lists+linux-input@lfdr.de>; Fri, 15 Mar 2024 09:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F49E17C61;
	Fri, 15 Mar 2024 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="utoYcpYg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9393117BBF
	for <linux-input@vger.kernel.org>; Fri, 15 Mar 2024 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710495202; cv=none; b=umz5I9hwWSqEvTfgMlPRkgynxl8WIITdVwH+kiv4Daq8K/FamiQBXFlolBwxfe+Cqy/yjryvdA+W+0RDZwtJQeScTjTmaNhz9rshDPz8rI3sOxnqVWRb7ebvhJJXBrNr1WS3XwPOG/iG+EehN1DGxGMBx+5Xh4wHUi8U/ktR318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710495202; c=relaxed/simple;
	bh=H2/X7CaT3a2hQCNjChDdPf4LiqLoSatfiRTrNLV/wIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uDGEmxn5ZZFV1YXl/29dko4WBOtoQkJu4OTgO67MhAQwR77KUIPRYzuGWMChP9juMipWVWiYrJSKDvk3X69k81xJ7EfG7eeNYxkushFS7Lz00kFhMpY3Zx+vDXD5GndL1HzhYhTiaihnb3v7z3STajDTKbnM4Q1p9B78sXLEC1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=utoYcpYg; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6BE401FA8C;
	Fri, 15 Mar 2024 10:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1710495192;
	bh=H2/X7CaT3a2hQCNjChDdPf4LiqLoSatfiRTrNLV/wIc=; h=From:To:Subject;
	b=utoYcpYgKDWA6LRjy3imRDY8Xo8/gd9nQHSvVQSk1aBrpPloWOB1TSZLEpmoEhBOD
	 Q0A/JRNafWj/sZkEP4rN+ZVpg3oPqyrnbjg7Nxwf+JfF+PZlYnop28tMQEfMPLTtJs
	 L0RhMV9VSFBUy9bbLasNV+KSG5F/M4ozKGpHSULHuG6g6+HCXUAsqwOzqXp2CAQh3t
	 bKGLxMAKFrmYr0lvaIHoDQXjlPzNCS/60kBwFEhtzQNR4Wf2sHUIC/5oEphqz/kuGQ
	 4EwICxCVqVnsa/+7MQW4wCYhn8BvwzfHDtniUjnhyl4Wfyw5OFzLfnJ8v7PwWThdPR
	 a0KAhAERO85eA==
Date: Fri, 15 Mar 2024 10:33:07 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Stefan Eichenberger <eichest@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: Advise needed on stale patches
Message-ID: <20240315093307.GA5060@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dmitry and Linux Input people,

In the last months I sent (or was involved in) a couple of small patches
[1][2] (bug fixes or small addition to an existing driver) and they have
been around in the mailing list for quite some time (months, 2023-09-20
the oldest one).

I am not sure on how to progress here, therefore looking for some advise.

Maybe they did just fall through the cracks, in this case just take this
as a kind head up (or maybe those email did not pass some aggressive
spam filtering?).

Or maybe the changes are not deemed correct or something wrong was done,
and in this case it would be great to know what we could improve.

Or, maybe you just had other priorities (life and work are challenging
at times, I know), in this case, if possible, I would love to know if I
can provide some small help in any way.

[1] https://lore.kernel.org/all/20240209105012.22470-1-eichest@gmail.com/
[2] https://lore.kernel.org/all/20231222183114.30775-1-francesco@dolcini.it/

Thanks,
Francesco

p.s. of course, I know that the Linux merge window is currently open and
these twos are busy weeks, I'm not expecting any action till the merge
window closes.


