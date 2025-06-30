Return-Path: <linux-input+bounces-13199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F8CAEDA83
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 13:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22D251896378
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 11:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22AB25A342;
	Mon, 30 Jun 2025 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="NrulHlnp"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B19F248F42;
	Mon, 30 Jun 2025 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281832; cv=none; b=nCbvr6CvqfONBawRpK6mH6417srZezVqdPl8EuWbtiLm+D9GZycgmqggvVH0gO3EUYcCdrNFl2gDd8sZewAekQGZcc6rK9XRwfKaHP7ht5UPrPdcIeSJPZzU+MaJGEWXmqzjH3Lf70CaEZAAyPmXooze1eDIxi1zlb8w6xGF+y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281832; c=relaxed/simple;
	bh=FS+0IsAEcf/8YetupDCeFWanaFNut8nmB0K9rokAwdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0hokoLptxlsadaAd5G2vvBrG/zyJwJtIcaORBNb9kUpFrTj8YVoiHxUZyxPcQHnwmYbYUepacw0jHFz3Oqfc5U6NrboOsBQCOMLuduApbOKnd5LyZ8tZqDHJGrAONKM5u9b701+Af1/UZIBLI/SAduRqmEtiFGcn9zZKXpBwV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=NrulHlnp; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=f4B4n+JwaYH31gzYKx4U+q3fOKVcjGRJWtiF6jcOJrE=; b=NrulHlnpgtzpqljl
	YJOZGmEIDqJKRXJNjqirwCCmB8XtA9lFbKyCVya3A86aHUVPYg1P1eXouQ0ryuvJWLiXvwO/TgY7+
	VnFg0EpetxDmIEMFx8S5Mr0yiiHiAX89ITeNdFDMGBc9Lwt2w9rDqLte0c6lcogjV7Wl55pYZKYfu
	r4mFRL0bN77dq8cNPfQIWWIvSxR8ryhpTO6yujAKqvWPbIooo7dV8bWyTVMws6qqK9QTf0pi4s2pq
	SPb1C5xW1oW4VN33QMiCS1fuz3zbWBWJfcNrH0/1k5ArKITUhzc03zZXB2bKCn8I+ws5fm919Q9M4
	7Je/KEDuUXNbuf9Z/A==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uWCP2-00Cx6T-2r;
	Mon, 30 Jun 2025 11:10:24 +0000
Date: Mon, 30 Jun 2025 11:10:24 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: lee@kernel.org, linux-input@vger.kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pcf50633-input - Remove
Message-ID: <aGJwoC5w8Gpl6vrB@gallifrey>
References: <20250629212820.319584-1-linux@treblig.org>
 <j3pkekg2mmbdbmguewoc5rks7263rxhveggkimbhmvkgxb5ikh@nwz553og3qtz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <j3pkekg2mmbdbmguewoc5rks7263rxhveggkimbhmvkgxb5ikh@nwz553og3qtz>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 11:10:14 up 63 days, 19:23,  1 user,  load average: 0.00, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Dmitry Torokhov (dmitry.torokhov@gmail.com) wrote:
> On Sun, Jun 29, 2025 at 10:28:20PM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > The pcf50633 was used as part of the OpenMoko devices but
> > the support for its main chip was recently removed in:
> > commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> > 
> > Remove the input code.
> > 
> > This was originally posted as a set of pcf50633 removals in March,
> > and is the only major component that hasn't been picked up.
> > https://lore.kernel.org/all/20250311014959.743322-1-linux@treblig.org/
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Applied, thank you.

Thanks!

Dave
> -- 
> Dmitry
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

