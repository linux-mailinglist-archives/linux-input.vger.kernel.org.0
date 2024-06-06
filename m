Return-Path: <linux-input+bounces-4160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5023F8FE0F8
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 10:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4837D1C22EC1
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 08:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050A513BACE;
	Thu,  6 Jun 2024 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKi5dunJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D56364BE;
	Thu,  6 Jun 2024 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717662666; cv=none; b=tKAhcxBZ2ymsOyx7eYUpAiDReMuI6Fjwb35XWqFHrZSgBAGTd26X5TNjTkF9nOUOlG05utamAGspwdhCYENtdX44abK28NogKx/fPr2/7HcD4UpG0pleLMxJ+k2AG66Tw78hEdmUuhtl1MgTNisWYZQ21xAE4v+loGF93SajK4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717662666; c=relaxed/simple;
	bh=gtSeDpwtTXP76h/L9LNnnIb5WqY2J6aN92FdZrtanvo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hEuyFcUSdIfH2QMSWlwLwLMxwaF0YOv+bOqJ8El6WP0GVvQ1npXREIucXIDBLnP/EDPQvGVdKSQPp0ejZ6ez/Rn1m5F83l1ex9n17XF1YFn5S4p1t5XdmhuaU7HhaKJ25YTUzuKwwKgfCokrwjW4HUMmH69yMV8dKvAUu0JUAYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKi5dunJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D194C2BD10;
	Thu,  6 Jun 2024 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717662666;
	bh=gtSeDpwtTXP76h/L9LNnnIb5WqY2J6aN92FdZrtanvo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pKi5dunJZ8ff+rFzh/kCYAArxYveGq9xJZsXqXcbJ3zdztBRWxO+HLU700ysqhl00
	 KFZ9IF2EFJf8mfdplpmK4ZsHJ1Smiwb7Ed+oIlOz7F+laBNmH1xazhNy+zxCvgM1rG
	 ZGmMAH2DPAmfYZ/oYLNi5+OfPVfsagNQau3y84/BJC3DXcVuf2fze5vDxtQKfZ1JWg
	 iso4FP56hZ/Ls2kxai2H9VycCd6itFjK1pBxfXY3Ki80SDaS5X7gYjv4EquSoRTr2Z
	 fE3/78kJgkABsPDRJYGs5ee41uOUtxep/tHXEFyd1tjtFvDMKcMirHCPoXp2KeLs9V
	 QCpNx+2iXQL1Q==
From: Benjamin Tissoires <bentiss@kernel.org>
To: dan.carpenter@linaro.org, Andrew Ballance <andrewjballance@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, luke@ljones.dev, 
 skhan@linuxfoundation.org, 
 syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com, 
 syzkaller-bugs@googlegroups.com, Benjamin Tissoires <bentiss@kernel.org>, 
 Jiri Kosina <jikos@kernel.org>
In-Reply-To: <20240602085023.1720492-1-andrewjballance@gmail.com>
References: <d87335b8-9eae-4689-87b4-b581c0b28c9b@moroto.mountain>
 <20240602085023.1720492-1-andrewjballance@gmail.com>
Subject: Re: [PATCH v2] hid: asus: asus_report_fixup: fix potential read
 out of bounds
Message-Id: <171766266391.2918443.4596267274284818390.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 10:31:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Sun, 02 Jun 2024 03:50:23 -0500, Andrew Ballance wrote:
> syzbot reported a potential read out of bounds in asus_report_fixup.
> 
> this patch adds checks so that a read out of bounds will not occur
> 
> 

Applied to hid/hid.git (for-6.10/upstream-fixes), thanks!

[1/1] hid: asus: asus_report_fixup: fix potential read out of bounds
      https://git.kernel.org/hid/hid/c/cfacaaf33cd7

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


