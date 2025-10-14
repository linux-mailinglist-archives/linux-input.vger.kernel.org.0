Return-Path: <linux-input+bounces-15464-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A4BD88E9
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E1DA4FBF6E
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F642ED14E;
	Tue, 14 Oct 2025 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkSeOYbr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431C02EB87B;
	Tue, 14 Oct 2025 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435258; cv=none; b=r1PrJnkmNfaMuVZG0drCUwTF6Q6BCnG6uMEQbkYEbTPrDbvZAzr+05T42G8dFzkzs6FiY1V3YOr3q7JZwWQZyefJebFqmagnV4TMFrKRcS+XVgz2RT4brqH/+DTsxfGfYdRxD7wRiV5PAAdSFYW6lnzxqFJyxWyJH9WdHlRIxb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435258; c=relaxed/simple;
	bh=f3pZPHipOpeDFB5HmbiCowZYLmKApYTA00fBc5KEnKs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AGtkaULutwvA6n8AAYOUfnj6lC3XBsQxq6Ogy9+zRt4vlMq/bBjox5EKegudoEFaR+444OlH6nZTiODMhTjAzSi0JEltqmn0wnDXlbiXw63G/TuE89kEOuro/iGA/Z19kpxdL9rwH3fbrCJemd6ySVo2JY0STv+YZmAvrEJ6mPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkSeOYbr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E686C4CEFE;
	Tue, 14 Oct 2025 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435257;
	bh=f3pZPHipOpeDFB5HmbiCowZYLmKApYTA00fBc5KEnKs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OkSeOYbrSVgSyQ8CIeG62JG2TPX1UbgK+pVUWntojszfaVtaGheZ8G7Ad7pikd5e5
	 F3CVwpquSef/hN40iMuLTBd2d+r8qGYk6G2ikVirBGCJppvtP3EqUus3gPwO+VFvil
	 YLhrU/sGiI+vUmPrmN28asdewKVAY/jtT2/tad0N/aGcURL5yrDuI5Nqz5RbYkkKvh
	 Dyr3kc5zWz4qwepo7pd6euT33pnvB4CmOG8V0WFe0Nd+9+Wx1vzp0qjLfdYBfl4XQA
	 sn5Y8k40/pqRX+keBOGSkkc0vhZFkC4TPWZGRA++k+pE+9E+lJqULmhfWhGWYjKnWm
	 OvenZ1mvpNCXw==
Date: Tue, 14 Oct 2025 11:47:35 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Deepak Sharma <deepak.sharma.472935@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
    skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
    syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] HID: cp2112: Add parameter validation to data
 length
In-Reply-To: <20250926145811.273174-1-deepak.sharma.472935@gmail.com>
Message-ID: <rq068421-84np-1s12-rq78-1q36q047qq04@xreary.bet>
References: <20250926145811.273174-1-deepak.sharma.472935@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Sep 2025, Deepak Sharma wrote:

> Syzkaller reported a stack OOB access in cp2112_write_req caused by lack
> of parameter validation for the user input in I2C SMBUS ioctl in cp2112
> driver
> 
> Add the parameter validation for the data->block[0] to be bounded by
> I2C_SMBUS_BLOCK_MAX + the additional compatibility padding
> 
> Reported-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=7617e19c8a59edfbd879
> Tested-by: syzbot+7617e19c8a59edfbd879@syzkaller.appspotmail.com
> Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>

Applied to hid.git#for-6.18/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


