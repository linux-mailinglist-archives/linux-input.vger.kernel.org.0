Return-Path: <linux-input+bounces-10529-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73919A4EE21
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4139D7A3E17
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C967124EA81;
	Tue,  4 Mar 2025 20:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ujxan6mY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18AA23F383;
	Tue,  4 Mar 2025 20:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741119193; cv=none; b=nGTda8UW7hlEOaBlFo2rwNAt+QwQ3QlJYPEilbmuGZ7HfhjdjyiilSyQDtotFtwCJl9u8aPnlgnf++Ige+nl6bdtRZ8HQUb2R9prItK3Kl271KSFAT6nRnnqN+fTHKXPH2P+/eOuIK2vu18pccG4kS/v7O1Db7mQvfJHCleoebc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741119193; c=relaxed/simple;
	bh=TQsQQNAgWUBHOv5jlfaVMYofpB2JAY2pNw5vXXDR4QI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=omVWaxEaGf/bHZoTCSYxUjouAiQNhtevC6WIGi5/zgO6YtuJugm6bMvCcTE+KB0eYdYocRY/3e1LtjSYpoDVPo18revJHjHVNQ1pixvu20hkut5+7OI6ld5GeU1FRUjdaIk8vvgjjUvm48KvjZn4m3UODx0UCSPEEdeZtc/Gpww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ujxan6mY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3ADC4CEE5;
	Tue,  4 Mar 2025 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741119192;
	bh=TQsQQNAgWUBHOv5jlfaVMYofpB2JAY2pNw5vXXDR4QI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ujxan6mYtP/5esS41aAxIdhUIZPA6LX+EA0BH8Rjj/Z7F06BI31TWQyK5OG7ODhHu
	 Mj9THWQ5nDO/eWSEvWZwO/oZoDSUImxxR472fcs5YgBRjWw1WoNAhBRvrlnZNyzghE
	 xjQE5mKhXt2oZIohrLxv+l0/y+HL5PsXUY7KZfS0oaoyMqCXNK/cREn/uzBZuroqNc
	 Afj6cY6RsI0EX/S9JE9m4d3nH8bS6TcDPER+QqeDfj9hL3cbLn6HNWlpCS3uo81rXg
	 u2xbOFsSDAKTIFSc0Epcz+lrlG8BluegBHaf1BQCqs9XIvoLSL2GqumHlWyzFjxll6
	 RGjirWckexH6A==
Date: Tue, 4 Mar 2025 21:13:09 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, 
    Vishnu Sankar <vsankar@lenovo.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] HID: lenovo: Fix to ensure the data as __le32 instead
 of u32
In-Reply-To: <20250114004159.102555-1-vishnuocv@gmail.com>
Message-ID: <n82p6032-740p-0o56-n808-99n5rpn9no23@xreary.bet>
References: <20250114004159.102555-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Jan 2025, Vishnu Sankar wrote:

> Ensure that data is treated as __le32 instead of u32 before
> applying le32_to_cpu.
> This patch fixes the sparse warning "sparse: cast to restricted __le32".
> 
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501101635.qJrwAOwf-lkp@intel.com/

Sorry for the delay, this fell in between cracks. Now applied.

-- 
Jiri Kosina
SUSE Labs


