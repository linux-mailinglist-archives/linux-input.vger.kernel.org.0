Return-Path: <linux-input+bounces-7482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE439A0237
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 09:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49EC21F24940
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 07:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5036E1AF0AE;
	Wed, 16 Oct 2024 07:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fkn+hu38"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB117C9FA;
	Wed, 16 Oct 2024 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729062872; cv=none; b=dZ4FjuFyQkh3KAgl4FpfG/0tajT/88ueugnwkDmzQRoVQEQveq0DhY+bWLk4zIdHOeQRhzr3KGlNlVlHP79+GdKX/PsMTvqzDu2v9XxkFIwb5j6FwdNuUmFQqZEOp3rnCD89UGqKg6S99ge2Opa+t8AE4UftzN0ink+3/Y2YUJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729062872; c=relaxed/simple;
	bh=Q3kHXLQbSrondJ+e0RuvEzqQ7FhbPieKfYcghLcIaCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTuVEwswqITng4qUHrWX2r9Yz7ATdvUWQjxRKLTx5hT8s+GX6YfQ24ALpa+J8xaNlzUA84HBqMy6cOX1ow4E4CNbYQ1f33JjYe4iRlNIjTi+cXtHU6EMP6s3inRgeH0CwoC1UqKjvTjLP1Ga1rltEbXYdHpJnamaYGjFtMrFV+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fkn+hu38; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130ACC4CEC5;
	Wed, 16 Oct 2024 07:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729062870;
	bh=Q3kHXLQbSrondJ+e0RuvEzqQ7FhbPieKfYcghLcIaCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fkn+hu38z7AP8NlYdvO8HyOhHOiyzDgVchxtkIsLL+158xNsQ0+t1g/fzt+121x2A
	 vi1TEBsEEfVpLJrihR3Tu04P+/oKK/akV1RcJpcoXwQ9+EHiTaQXJtgvRjqLJZsHCJ
	 gRa3w/06F7B1h2GxsG7xPmOENsXINTvn+c8oSOQs=
Date: Wed, 16 Oct 2024 09:14:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+ce483fd06e2061f44f5d@syzkaller.appspotmail.com>,
	akpm@linux-foundation.org, liam.howlett@oracle.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
	Marcello Sylvester Bauer <sylv@sylv.io>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [syzbot] [input?] [usb?] [mm?] INFO: rcu detected stall in
 vma_link_file
Message-ID: <2024101602-skintight-crawfish-ebab@gregkh>
References: <ji3zt22xdnr2wieepeudioxg6uqthwxtbut6w2ec55lmnnzghv@c4jwoow5u2gg>
 <670ed017.050a0220.d9b66.0156.GAE@google.com>
 <bacc4301-be1a-4f3f-9da3-1543cbf9874c@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bacc4301-be1a-4f3f-9da3-1543cbf9874c@lucifer.local>

On Wed, Oct 16, 2024 at 08:06:20AM +0100, Lorenzo Stoakes wrote:
> + some people from USB/HID subsystem.
> 
> This is really not looking mm-related, as for a second time we've asked
> syzbot to re-run and for a second time it's not hit any mm-specific code -
> I think this is misattributed - could somebody from the USB/HID side take a
> look?
> 
> It looks to be something that isn't reproduced by a specific C program but
> by a syzkaller USB configuration [0]?

There's a lot of odd usb syzbot issues right now dealing with the dummy
hcd controller, so maybe this is another one of them...

thanks,

greg k-h

