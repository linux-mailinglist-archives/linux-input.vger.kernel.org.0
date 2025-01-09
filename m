Return-Path: <linux-input+bounces-9101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A243A070EC
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D76A16155C
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508A4215072;
	Thu,  9 Jan 2025 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="no/udivF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D6B2144DD;
	Thu,  9 Jan 2025 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413667; cv=none; b=tWnr398PzL5sKSNxEZHjf+Xt5Vf/2NUw+4vb+t1nu0WhjasfSu0QmRoGq/VjN+6ThcnLnsWGeMffWwRjh1wMoOXOWo1ob+0CnXVivPfM7BepDOvkD99SVbRmYi7BNXv3XOE3PSSrZao5rcQiWwJZPl+8lD+mQJgk5RwPpk/JQmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413667; c=relaxed/simple;
	bh=kCZJHYkTZ6PcjphRjEJz1QzfE8zO9hjqpcA0cSXxM78=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UDVjfh+U3a9WHddW5UMLh0qOTFblzkGCo3uBLOD7zWYybZakNQ/Rv0Qw/hjq8CPV8q2oISgRbhJ1dkzcC+DKErtYGtqzq1jsqW8f54zX6VF1k26n+Q/Nd86c4+QPjPh7orIgQ1jkgUIom9SS2P/MrdT2CELE6zBBLu00LMJiJXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=no/udivF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D99C4CED2;
	Thu,  9 Jan 2025 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413667;
	bh=kCZJHYkTZ6PcjphRjEJz1QzfE8zO9hjqpcA0cSXxM78=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=no/udivFXMpIbvTe6AY1lkQIn9nDq5/yrBR9adzt2Nq3nGgyCR3Ag5RObc7hXJn+h
	 pwwo10okQqc15pkOk1iOkURRyn0atDWXFRS2q/MFmY+/Pkw8wB/LW0Vm+CFGncvkok
	 ku5/6rJQcpmiEwGNv/XkUdUrQg58yeExRSnu8cY8rkzHma8lGyEfJ+fIaa6zAPEPeb
	 8Z2IfNnit9JRzNifRiTdrBPPm0hZ6eksOi3zi5//TxOP8S68lZotNRSqlQqTiylUaH
	 2N6eyWaotxhHd2lejA1qFyoIiwiYccanQ+31QNZEM00uGdNtq7auvHkFa6JnA6EsoQ
	 bax2wdoXIZQ3w==
Date: Thu, 9 Jan 2025 10:07:44 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org, 
    USB mailing list <linux-usb@vger.kernel.org>, 
    syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>, 
    syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: core: Fix assumption that Resolution Multipliers
 must be in Logical Collections
In-Reply-To: <18b853f8-9da5-4a28-a845-111d42299478@rowland.harvard.edu>
Message-ID: <69n008o0-42s0-o955-o9np-6r1rp0nq4on8@xreary.bet>
References: <18b853f8-9da5-4a28-a845-111d42299478@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 Dec 2024, Alan Stern wrote:

> A report in 2019 by the syzbot fuzzer was found to be connected to two
> errors in the HID core associated with Resolution Multipliers.  One of
> the errors was fixed by commit ea427a222d8b ("HID: core: Fix deadloop
> in hid_apply_multiplier."), but the other has not been fixed.
> 
> This error arises because hid_apply_multipler() assumes that every
> Resolution Multiplier control is contained in a Logical Collection,
> i.e., there's no way the routine can ever set multiplier_collection to
> NULL.  This is in spite of the fact that the function starts with a
> big comment saying:
> 
> 	 * "The Resolution Multiplier control must be contained in the same
> 	 * Logical Collection as the control(s) to which it is to be applied.
> 	   ...
> 	 *  If no Logical Collection is
> 	 * defined, the Resolution Multiplier is associated with all
> 	 * controls in the report."
> 	 * HID Usage Table, v1.12, Section 4.3.1, p30
> 	 *
> 	 * Thus, search from the current collection upwards until we find a
> 	 * logical collection...
> 
> The comment and the code overlook the possibility that none of the
> collections found may be a Logical Collection.
> 
> The fix is to set the multiplier_collection pointer to NULL if the
> collection found isn't a Logical Collection.
> 
> Reported-by: syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/000000000000109c040597dc5843@google.com/
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Cc: Peter Hutterer <peter.hutterer@who-t.net>
> Fixes: 5a4abb36f312 ("HID: core: process the Resolution Multiplier")
> Cc: stable@vger.kernel.org

Thanks a lot for hunting this down, Alan! Applied.

-- 
Jiri Kosina
SUSE Labs


