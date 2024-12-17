Return-Path: <linux-input+bounces-8631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B09F50A1
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 17:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51C4A189015E
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 16:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656941F7078;
	Tue, 17 Dec 2024 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="b7VdfIIy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF151F7577
	for <linux-input@vger.kernel.org>; Tue, 17 Dec 2024 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451454; cv=none; b=RwCTkvEq/h8DKvzpVdZyrNpbzq3O+HOJjpJn72YZC8dVOZkwLTHTEtTy00g8rEVqwMrKfdHmz7W+KmwzzoHE/VWo/VjsVKWBDGQA5LUbXJuIXfCNottC+w90JgNpCbfCdgVhBdUMwLFluS7Ky2ZemHI2qzm2SBcx0vU5nC8bmEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451454; c=relaxed/simple;
	bh=sz4UHzE58a62cxCyjMCcMny04PWq/ObaI70WeR1H6fc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=apdX0HXu59aoMmS+8PJVt/zwhU8LYCTnxfhgA3RYsC1GQNMWBWpV8jEJWEMdDns63SHadbmuV2XajRM1J3mEwqlpJROFwh13189gxzYldGgtq9Y+8pZCTaHMhLq+HFwSW3MDdF4TMVOR42AYJweYYST8ZyFhf+KgchhUGI4ryys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=b7VdfIIy; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467918c360aso63940091cf.0
        for <linux-input@vger.kernel.org>; Tue, 17 Dec 2024 08:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1734451451; x=1735056251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=slfmR4f6JEMR7P5krJ3/zU7vcEz2d/jhP/t5zje24Qg=;
        b=b7VdfIIyGfVu9RGKdU1dpES3+JTPoQSJpPkxfFtzyIwpPKIrRY3GGKhD26byiqtTfD
         uksa+t1BPoXFHS2O9M/mVeXMwLnTXITDDX1bCOU7zq+zQ/a1X/FtSyI8ruMYzYitnO/r
         9EkEHVKBHnC7sx1euH2Vkp2PV+/zRKDnmhUdcKyt8Prn3gmGzNTOF60QLXV/nifEkm/0
         NWdWbu1RthVB0LlCPqDQ3KOnBN0Lwyv+y09QR0RFqWuEfePvbagdGY2iExvYBdbV/x++
         yNW1AYwZrqrauod3M/x502iiCFMgeTDywnCoFVvfDZy6iGZd5zpE2kXOZ59vzdRVv4JZ
         Zdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734451451; x=1735056251;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slfmR4f6JEMR7P5krJ3/zU7vcEz2d/jhP/t5zje24Qg=;
        b=ZVKNjyPvUdyKCNdJWWAu22Qo/4SgeVaGu5bWP9C4FDdhyRbWWZ2Xmp6x13Moc/1Ah8
         7ZyT/ZtZXU0WnqPcR/9yh2WJhxLOMwfMnuwbOM05b/vBC2BhB81ZleSVNF6UX7spV+2w
         tx1dIUmEO2CtePuwnHI8dpbxCR5Cn4J5lKiWU1YPVkA0PaMWZqHwktdrSnIusSWrKpMN
         BHF1oC7wDF3psGL7vw6zdQwnyX7+FyRjj6H+LXyiE3zdTxMJp2YVrdBaHpPBedFPn6Hp
         Qc6/gxZ2E1SR7h3YtE/SJPo/c17OW2DmReKkpx0jhYuXJf+7fyLBRjUruU9SLfW6wkdy
         3iqA==
X-Gm-Message-State: AOJu0YyHY32jM88ctw51x/aEls5EhxaaqWSSPSp6Ip/dbtltAvr+tDAh
	Rjk0RLHwcBq3pA2nTep8zrRYyjbmVMrD1OK9q1Xxuw0iFLn5Rz1c5BJ4aD9qZQ==
X-Gm-Gg: ASbGnctmgkMLG49b0N+7+wzR/5ZcKqj1vtMdm1jfZTG/CFTn3dbuQid8Y6Ar4tc5G/V
	utIqjHFyVMIKtMW3pvWq7izoUicDiV06klfp0DyYrEoNhd/hnXeK/7gVZoRX67WzWqMHKzHEczw
	BkmXM0Evrth5EuZ40KjgT1U1CH/z7rp7wDwiyBGo0O0kPP41q2jZ8j99EtIS4Q5wIvcmAi0u+lZ
	QotwvlsiR/B2dg+jmqWKCjQiwI0qsrzcCbF1DmknjqP9GnQrwOjxHU33A==
X-Google-Smtp-Source: AGHT+IEDstIjPRnOTwY4eR6F8+qvzX9ZxamWJPa3FMKvSfy9PlDwYuMe0lIQPgYqXx+DYILoZ5yE9Q==
X-Received: by 2002:a05:622a:1a8a:b0:466:ab8f:8972 with SMTP id d75a77b69052e-467a5718bb3mr342033971cf.3.1734451451159;
        Tue, 17 Dec 2024 08:04:11 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::ba54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e8195csm40552301cf.57.2024.12.17.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 08:04:10 -0800 (PST)
Date: Tue, 17 Dec 2024 11:04:07 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: INFO: rcu detected stall in hub_event
Message-ID: <fdefac3a-fa4b-4102-9c8a-4ba711beefe3@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ade3bb13-e612-49a6-ace2-bf6eeca93f8e@rowland.harvard.edu>

Jiri and Benjamin:

The syzbot monthly USB report led to this old email message, which was 
never answered.  The full bug report and email thread are here:

https://lore.kernel.org/all/000000000000109c040597dc5843@google.com/T/

The bug still has not been fixed, according to syzbot.  Please review 
this material and let me know whether the patch should be changed or 
submitted.

Thanks,

Alan Stern

On Mon, Apr 08, 2024 at 12:55:13PM -0400, Alan Stern wrote:
> Jiri and Benjamin:
> 
> Tracking down an old syzbot report from over four years ago (but still 
> not closed out!) led me to this email thread.  It turned out there were 
> two separate bugs involved, one of which has since been fixed.  I don't 
> remember the issues very well, so here's a copy of what I wrote back 
> then:
> 
> On Mon, 09 Dec 2019, Alan Stern wrote:
> 
> >  The big problem is that the parser assumes all usages will
> > belong to a collection.
> > 
> > There's also a second, smaller bug: hid_apply_multipler() assumes every
> > Resolution Multiplier control is associated with a Logical Collection
> > (i.e., there's no way the routine can ever set multiplier_collection to
> > NULL) even though there's a big quotation from the HID Usage Table
> > manual at the start of the function saying that they don't have to be.  
> > This bug can be fixed easily, though.
> > 
> > The first bug is more troublesome.  hid_add_usage() explicitly sets the 
> > parser->local.collection_index[] entry to 0 if the current collection 
> > stack is empty.  But there's no way to distinguish this 0 from a 
> > genuine index value that happens to point to the first collection!
> > 
> > So what should happen when a usage appears outside of all collections?  
> > Is it a bug in the report descriptor (the current code suggests that it 
> > is not)?
> > 
> > Or should we use a different sentinel value for the collection_index[]
> > entry, one that cannot be confused with a genuine value, such as
> > UINT_MAX?
> 
> Syzbot tested a proposed patch:
> 
> On Tue, 26 Nov 2019, syzbot wrote:
> 
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger
> > crash:
> >
> > Reported-and-tested-by:
> > syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com
> 
> Here is the patch that syzbot tested:
> 
>  drivers/hid/hid-core.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> Index: usb-devel/drivers/hid/hid-core.c
> ===================================================================
> --- usb-devel.orig/drivers/hid/hid-core.c
> +++ usb-devel/drivers/hid/hid-core.c
> @@ -1057,6 +1057,8 @@ static void hid_apply_multiplier(struct
>  	while (multiplier_collection->parent_idx != -1 &&
>  	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
>  		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
> +	if (multiplier_collection->type != HID_COLLECTION_LOGICAL)
> +		multiplier_collection = NULL;
>  
>  	effective_multiplier = hid_calculate_multiplier(hid, multiplier);
>  
> @@ -1191,6 +1193,9 @@ int hid_open_report(struct hid_device *d
>  	}
>  	device->collection_size = HID_DEFAULT_NUM_COLLECTIONS;
>  
> +	/* Needed for usages before the first collection */
> +	device->collection[0].parent_idx = -1;
> +
>  	ret = -EINVAL;
>  	while ((start = fetch_item(start, end, &item)) != NULL) {
>  
> 
> The second hunk, addressing the first bug described above, was 
> implemented in commit ea427a222d8b ("HID: core: Fix deadloop in 
> hid_apply_multiplier.") in 2023.  But the first hunk, addressing the 
> second bug, is still outstanding.
> 
> You guys undoubtedly understand this code much better than I do.  Is the 
> first hunk in this patch still required?  Is it a correct fix for 
> handling Resolution Multiplier controls not associated with any Logical 
> Collection?
> 
> Alan Stern

