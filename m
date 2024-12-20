Return-Path: <linux-input+bounces-8707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD979F9947
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 19:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18042167AE1
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 18:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BE821C171;
	Fri, 20 Dec 2024 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+dzlBQS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACEB1A841A;
	Fri, 20 Dec 2024 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734718604; cv=none; b=HL7m7XcQLojhlhM7W2ZXuafqVYq80wAJscevahWzRA4XmRZN7kMgD4TQp7pupkauafbn7/lKu6LAvq/wEazEpfAu7SNoxhSdzIK8RYspLjcXJ1TmaEiunEf6GTv4P2n1Z/mHQwwFJms3NDnRuAlsTCxKvHPlHIpI7d9HTiI16Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734718604; c=relaxed/simple;
	bh=jnR9j+TmFadSeUnrufxU2p65D+Gf7Ax8IO03Oo4iNeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ki1m14TZKu3wg6dz4VqdrCi6uMJT+bhw6DSlWIDzI6h8jbPft4iq/5ESNIxQO+fOyzppN8/JXxI45EwAfAAEdkkoaKm5i3ei1SZXgWf4VSuw5MiORZQGMSIu2Gu87XWyg0j4MB/MC67rfL7woMFw9gBzTs8YjtFeR8GzRoR1nd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+dzlBQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BD1C4CECD;
	Fri, 20 Dec 2024 18:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734718603;
	bh=jnR9j+TmFadSeUnrufxU2p65D+Gf7Ax8IO03Oo4iNeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+dzlBQS6b/nFjKcsO3XhPBMtu/F9w+KVsUMH0gyG/SsbhU9XQfa1RrqKSVRzsujz
	 MCWRJgQDsAPs388yJRl0Wl4lC0ZTQlyJLNjOo/Qvu392FvsVWB5Dr8gQQ24bztFLjQ
	 7COkbEs3JWDgrbEVTGbKRp7NBq1qgM+p4sfK8FvdkrW26KHaMhIX1hM0f6d7IFKqwc
	 jyuLp+zR5anJ8az6hHkUmVeMicA2HZ9Dj2LiCRSj8vJLc90iTCtq7WPHuooFh7lemB
	 3qPS4J1nPHMyfaFphy7XDJ0EgwauQXPrb2Oq2Tf70nGiuzQfhCQPkOCa0RIuNQLEZg
	 Kn4mT/YywqGug==
Date: Fri, 20 Dec 2024 19:16:39 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: INFO: rcu detected stall in hub_event
Message-ID: <g6wfezt4q746flglh4bteqieooskgbcdyalzkwgtw6fbm5zqle@7zmn625m3eet>
References: <ade3bb13-e612-49a6-ace2-bf6eeca93f8e@rowland.harvard.edu>
 <fdefac3a-fa4b-4102-9c8a-4ba711beefe3@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdefac3a-fa4b-4102-9c8a-4ba711beefe3@rowland.harvard.edu>

Hi Alan

[quick FYI, I'm lagging a lot upstream. I had a rough time in
November and then got some internal work which lead me to be less
present upstream. And now the holidays are coming. sigh]

On Dec 17 2024, Alan Stern wrote:
> Jiri and Benjamin:
> 
> The syzbot monthly USB report led to this old email message, which was 
> never answered.  The full bug report and email thread are here:
> 
> https://lore.kernel.org/all/000000000000109c040597dc5843@google.com/T/
> 
> The bug still has not been fixed, according to syzbot.  Please review 
> this material and let me know whether the patch should be changed or 
> submitted.

Sorry this fell through the cracks.

> 
> Thanks,
> 
> Alan Stern
> 
> On Mon, Apr 08, 2024 at 12:55:13PM -0400, Alan Stern wrote:
> > Jiri and Benjamin:
> > 
> > Tracking down an old syzbot report from over four years ago (but still 
> > not closed out!) led me to this email thread.  It turned out there were 
> > two separate bugs involved, one of which has since been fixed.  I don't 
> > remember the issues very well, so here's a copy of what I wrote back 
> > then:
> > 
> > On Mon, 09 Dec 2019, Alan Stern wrote:
> > 
> > >  The big problem is that the parser assumes all usages will
> > > belong to a collection.
> > > 
> > > There's also a second, smaller bug: hid_apply_multipler() assumes every
> > > Resolution Multiplier control is associated with a Logical Collection
> > > (i.e., there's no way the routine can ever set multiplier_collection to
> > > NULL) even though there's a big quotation from the HID Usage Table
> > > manual at the start of the function saying that they don't have to be.  
> > > This bug can be fixed easily, though.
> > > 
> > > The first bug is more troublesome.  hid_add_usage() explicitly sets the 
> > > parser->local.collection_index[] entry to 0 if the current collection 
> > > stack is empty.  But there's no way to distinguish this 0 from a 
> > > genuine index value that happens to point to the first collection!
> > > 
> > > So what should happen when a usage appears outside of all collections?  
> > > Is it a bug in the report descriptor (the current code suggests that it 
> > > is not)?
> > > 
> > > Or should we use a different sentinel value for the collection_index[]
> > > entry, one that cannot be confused with a genuine value, such as
> > > UINT_MAX?
> > 
> > Syzbot tested a proposed patch:
> > 
> > On Tue, 26 Nov 2019, syzbot wrote:
> > 
> > > Hello,
> > >
> > > syzbot has tested the proposed patch and the reproducer did not trigger
> > > crash:
> > >
> > > Reported-and-tested-by:
> > > syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com
> > 
> > Here is the patch that syzbot tested:
> > 
> >  drivers/hid/hid-core.c |    5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > Index: usb-devel/drivers/hid/hid-core.c
> > ===================================================================
> > --- usb-devel.orig/drivers/hid/hid-core.c
> > +++ usb-devel/drivers/hid/hid-core.c
> > @@ -1057,6 +1057,8 @@ static void hid_apply_multiplier(struct
> >  	while (multiplier_collection->parent_idx != -1 &&
> >  	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
> >  		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
> > +	if (multiplier_collection->type != HID_COLLECTION_LOGICAL)
> > +		multiplier_collection = NULL;

As far as I can tell, this might be good.
I had a hard time finding out if this is correct, but we are in
undefined behavior, so we should probably just fix the bug.

The selftests are all passing[0], so I guess we just need to respin the
patch dropping the second hunk, no?

Cheers,
Benjamin

[0] https://gitlab.freedesktop.org/bentiss/hid/-/pipelines/1333833

> >  
> >  	effective_multiplier = hid_calculate_multiplier(hid, multiplier);
> >  
> > @@ -1191,6 +1193,9 @@ int hid_open_report(struct hid_device *d
> >  	}
> >  	device->collection_size = HID_DEFAULT_NUM_COLLECTIONS;
> >  
> > +	/* Needed for usages before the first collection */
> > +	device->collection[0].parent_idx = -1;
> > +
> >  	ret = -EINVAL;
> >  	while ((start = fetch_item(start, end, &item)) != NULL) {
> >  
> > 
> > The second hunk, addressing the first bug described above, was 
> > implemented in commit ea427a222d8b ("HID: core: Fix deadloop in 
> > hid_apply_multiplier.") in 2023.  But the first hunk, addressing the 
> > second bug, is still outstanding.
> > 
> > You guys undoubtedly understand this code much better than I do.  Is the 
> > first hunk in this patch still required?  Is it a correct fix for 
> > handling Resolution Multiplier controls not associated with any Logical 
> > Collection?
> > 
> > Alan Stern

