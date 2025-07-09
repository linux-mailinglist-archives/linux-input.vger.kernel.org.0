Return-Path: <linux-input+bounces-13439-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FA8AFEDA5
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 17:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B1A17BFE56
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 15:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242132E7160;
	Wed,  9 Jul 2025 15:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="U7yiqklM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C41DFE1
	for <linux-input@vger.kernel.org>; Wed,  9 Jul 2025 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752074184; cv=none; b=EsFLa66peloi3bXNX45HLY1aLlBKtwfsleZZehobByqMxqtbQCV06STYYWDqmJREWfUd8fd9L4lm2aHm8nX9akj4tQGVIMMZgvFiPhyY2K35ctLexkb7FbM3+zBiB0jvLKVjGyDhMnqKl+qMX2Nk6ERmhL/4EBIXQP1ldKWQayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752074184; c=relaxed/simple;
	bh=M/PkNLdrJfoEMHKFRc7KNT/Eas8/BG1qL2VpbXSMSYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp5dkCJNFTqeJrt3wEJRXrL2iYcTcTikwwWxYEbx3JEC4b3Kdwsvr8ab25fAWqhnoI6JoldyRt6g2sRRZTUGPPQ04QgCn5Yg1W9SrNjyh8DgVnfytyrOhoWTi7/W5IuSpPq2VYYiiCAuzcv8BoJUxo4gVfXu+JDUob8aXFrz7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=U7yiqklM; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fa980d05a8so33916d6.2
        for <linux-input@vger.kernel.org>; Wed, 09 Jul 2025 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752074181; x=1752678981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WsdbYMtsoP5IHaj/P7/gA1hMWGSlzJbOloShXNDUswc=;
        b=U7yiqklMF/wiXVknih+/VVtUi26jOJU7fYYl3Yk2FMEuGwuzJxkxuf3rU2Yj2kjzK8
         +GNHdykloZrSmMJk0VgycXNdD93csk5p6DsxVSabrHFCTMeUgucZQB2wbKziKsXqvett
         PXOUdMFRlN/8jG7bqBvXnqPKaCaLtWtkdHaCrPqptYqrfEO9fUewiU7FFXxZeh00yDdI
         GwVPDov3Z3v35FdhJ17Xonez5hAwCe7EVHt1H1jYvimVI7u5QFeC6+I4UbbXOQ9Z80FL
         Sjv+7lLZGPLnv6+AYVPlE5Mhy27YTRHSiobXp5KN1iKGBMsk1rU9sOfLzvWIfbIvfPUB
         9QtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074181; x=1752678981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsdbYMtsoP5IHaj/P7/gA1hMWGSlzJbOloShXNDUswc=;
        b=b2wEh/n/Vz82O1czVjQ9IOqx6PvEwUT2Drb24TVpZ5sI2iwvCX7UswNQ4JSXt2OTME
         2h4avlqxD7pad+l/tbpCZFFYe6AISHZd5Wp9TMCES1PgSqfFF0Wna0w5Px5ACXya3SgZ
         3EIDZKFLbqb1yMv2KWiIe24NGYHFX5AKyya7rvysYo1KkbAZHlGPviDPYfUJK4oJ4jbr
         F0UU1nxzVDJMtO8KsBO0O3FVNgTrlKqYxw6y6jvccri0XiWufyXksvMuFSN9JAg3SWPo
         ZFoeeckNO6d2QjbB/hKvGVGIwy3E5loGozRy7fJNhJfL5qAnPfQP2x7qWTUGi30dQdW2
         Yt+A==
X-Forwarded-Encrypted: i=1; AJvYcCXgSTWNQNKrC1jS2NBCgK6RxDZHQYczj6ZcWw3WTWh/kaHRlfTW7WaAg1fyrBASiwk4noYNmOoj9Nz0yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy21E62fCGsy7K4uSGs3hWJi75jex4u6pnozGuu81bZfGa0J//
	qXay8KCUC6lAZjaGT5bg/xr+vVOC1OjSu9m8s83kchgXBrSlIOH6w4AAaf7nNxgxng==
X-Gm-Gg: ASbGncuqqYEixI3ZTBweoNci0yiS+x8GJbYSJYsxVpQPZhYa6EVotGPmzMlPeV1XbxP
	kdyffvCt38/ZFtoEXz+SvkVSTSm8WNNyIuk6wV6Da5NBggj2lEhcD5Ha5ewMMK5XJTR5t8TcXFK
	c3cmNXoP0ll0uudaRcgtlY5DaP/stki67MceDP1lym2XGKC+EQ94Vn5vo03sBjrBtL3Y0iJz2Q+
	FEEWjne/PEXE9nud0kbEe3gsdMHkQe5sZ40JboVKBmKzsLyZH2r08JS53iKRanOtwq/jEW4lwwC
	OLGP/qp2+21/A59aNbcRfXzbW/j3Dm00O2hBWvlIoLzroB+0q+VRcSuOFaoawytEc7FAqT7UuA0
	a7Gb+Ls5eEYoSmGk=
X-Google-Smtp-Source: AGHT+IFq/SMjQ8dE1aCLNMU2QhHo/z3MoLApUn/DvXQi38UdxBF+ToGFDbulcQ4Suod/amuFPLUcvA==
X-Received: by 2002:a05:6214:3d11:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-7048b9da2e3mr38991956d6.44.1752074176556;
        Wed, 09 Jul 2025 08:16:16 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4ccd715sm93276016d6.47.2025.07.09.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:16:15 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:16:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Serious bug in HID core
Message-ID: <b18af9f1-e3d8-429a-b313-38cc279e0f87@rowland.harvard.edu>
References: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
 <drcvdlw2kpuvsbact2gy4hvqp2i3au3shv5ozp3qms7qdfvi7t@7jofrodxeimb>
 <e3a58c95-9501-4ec8-902e-2a73402d1fe3@rowland.harvard.edu>
 <5rkp3gbrqvsdgia57eyw65jnu4wmpx6sbk47kmv4akmz2q7nzz@clqgtjfk2qxk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5rkp3gbrqvsdgia57eyw65jnu4wmpx6sbk47kmv4akmz2q7nzz@clqgtjfk2qxk>

On Wed, Jul 09, 2025 at 10:44:35AM +0200, Benjamin Tissoires wrote:
> On Jul 08 2025, Alan Stern wrote:
> > On Tue, Jul 08, 2025 at 05:51:08PM +0200, Benjamin Tissoires wrote:
> > > The second one would need a little bit more understanding of the fake
> > > report descriptor provided by syzbot.
> > 
> > I suppose we can get the information from syzbot if it's really 
> > necessary.  But it seems to be a minor point.
> 
> Well, to me it's important because I can get an easier reproducer and
> add this corner case in the HID test suite :) Not to mention the
> understanding on how we can get to this corner case.

I can get it for you if you really want to see it.  It's just a question 
of asking syzbot to run the reproducer with a patch that prints all the 
report descriptors.

Presumably this is just an ordinary output report descriptor containing 
no fields (or usages, or whatever they're called).  Even if it isn't, I 
would expect any such output report to trigger the bug.

> > > The first byte should always be reserved to the report ID, and is
> > > populated by 0 by hid-core when the report ID is not in use.
> > 
> > Then why does hid_output_report() do this:
> > 
> > 	if (report->id > 0)
> > 		*data++ = report->id;
> > 
> > ?  The first byte is not reserved for the ID when the ID is 0.  
> > According to what you said, the assignment should be unconditional.  
> > Isn't that a genuine bug?
> 
> In my mind, hid_output_report() is doing the correct thing: it fills the
> provided buffer with the data the device is expected to receive.
> 
> However, the HID subsystem convention is that when accessing the low
> level driver, the first byte is always reserved to the report ID, even
> if it's null and should be ignored by the device.
> 
> So I think one of the problems is that __hid_request() should actually
> shifts it's buffer by one in case the report ID is 0, to reserve the
> first byte for the report ID. Likewise, if the report ID is 0, the len
> variable should be incremented.

In other words, in __hid_request() we should change:

	if (reqtype == HID_REQ_SET_REPORT)
		hid_output_report(report, buf);

to:

	if (reqtype == HID_REQ_SET_REPORT) {
		/*
		 * If report->id is 0, the report ID byte is not counted by
		 * hid_report_len() and not reserved by hid_output_report(),
		 * so we have to do those things here.
		 */
		if (report->id == 0) {
			++len;
			buf[0] = 0;
			hid_output_report(report, buf + 1);
		} else {
			hid_output_report(report, buf);
		}
	}

Right?

> > And shouldn't the length computed by hid_alloc_report_buf() be one 
> > larger than it is when the ID is 0?
> 
> Yes, that seems to be correct, but I believe we never had the issue
> because this function already allocates 7 extra bytes for implement() to
> be working (see drivers/hid/hid-steam.c comment in steam_recv_report()
> for a similar conclusion).

Hmmm.  The comment in hid_alloc_report_buf() says that implement() 
operates on 8-byte chunks.  Do those chunks start at the beginning of 
the buffer or at the beginning of the report data (i.e., the second byte 
of the buffer)?  In the latter case the function should allocate an 
extra 8 bytes, not 7.

> I can try to provide a series today for fixing all of this mess. But I
> must confess that I'm currently swamped for the next 2 weeks. Yay for me
> then :(
> 
> [side note: I took the c reproducer, compiled it locally but this did
> not triggered the bug... Given that many of the individual patches from
> the series will potentially fix the bug (multiple layers of fixing),
> it's a little bit sad I can not reproduce locally.]

I can send a patch that does the change shown above, if syzbot's testing 
shows that it fixes the bug.  That ought to help lighten your load.

Alan Stern

