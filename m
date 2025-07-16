Return-Path: <linux-input+bounces-13567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B8B07A7A
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 17:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A1804E5165
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 15:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA59273D9E;
	Wed, 16 Jul 2025 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="v1Yz0V9Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC028BA9A
	for <linux-input@vger.kernel.org>; Wed, 16 Jul 2025 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752681500; cv=none; b=qfUW2pU4/gSUduNQvOQ1Y7ZSUzdqYpA5Przj9K2OanqDm7xnZmxT1B5shFb/bI7Pp+2Ir94e3+VtpRw8Y66EAZxq0tkThTNabMrZPvOWshLhWh4i6llTeK6LGjDsKzc+iPi4BhkL+4kPkNB+Fd+uIyKRnkFsJs0eRaBU2eUF5+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752681500; c=relaxed/simple;
	bh=6nqta9AmEHYZq91Htn1KwyrNmyqwvXdb3uNy1YSYzkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfHOlYxL9AHbfZnMLtQm4DZh7S7jvEnYMp1OErLt9cI0mXUC391qge/CiWpSOTV9UZDcTMCwUYVKsBk+VvBxPi0MhyTwl/icqkcwjd1NkprzM7Rcdxhnp0SlmXeZlrRHgh4AIQbiS4iSWTSTH+YWteSmK5yaaYmJZMS9I3uAk6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=v1Yz0V9Q; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fadb9a0325so764336d6.2
        for <linux-input@vger.kernel.org>; Wed, 16 Jul 2025 08:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752681497; x=1753286297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oCmbG5Cc4Qj+GuEi5hKR3TL5SByYcFwAYZ/BLKGNEyk=;
        b=v1Yz0V9QhpdCBNwrGl9VkA2KwSRVYbxOyYZ7iYKXINTodHEPOGDCDpCWwa63xArZEQ
         JJtlce3emswEPUkYg20yq3UtCYk22wJmGujgYqMQ+8fqwxAQNXDPI95I6lmcCAEzbnhq
         8Co1J8k6OWS/JLSeSvoCPeT4jGd2E36zRAbyfT4DZl84Il5/I/rzS4h+t/NEkIL+96hX
         blZuxfjiROgrTFPU9B9DUAYJydNWzhnYgh1ExqWRV/V0FfJD9D5NKTC6Jb1ZZiwrUWpC
         woT1c8YqeLZt+Kbg2xHnLsmpfF07OD8I6YQDS5oJdUo6imHtHek1o7ose+n+BZ8xwy/H
         tmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752681497; x=1753286297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCmbG5Cc4Qj+GuEi5hKR3TL5SByYcFwAYZ/BLKGNEyk=;
        b=aZcd34w4hiVn/cPCcg3OJqLl/5mfNRpdjBX1YD5pRxU/EiRQv4jgx4nYCLbbdkv++L
         yJoe2pjlw8rVwB41sXwTRyeo1BRyoTYEfzIUf8tWLXsvJXeSiTDiexMFZlznpGjHiuRU
         KR+3WnDKe5K1Jq5fzhzWfjLAmPDT2u7yU8griZc1JMDEYPSXw3W4URX21RBoT9eg24Q2
         +CUdnhKjLj14YAI8AdJ+pDnWboytBI7XpaF1mTf1SVnSwvk2n6rX0DLlhE//cCRw+eLR
         U5MeqW+Iq0APH1aylk+KwDRI2u1WyBxSEZyePz7oWwGQi9T+4uTMhEvWW8+ED9m+wV7Y
         Cj9A==
X-Forwarded-Encrypted: i=1; AJvYcCU9zNenXaFj/jPn8glRaEQDHR0ijNsJLtjf3BMs30Md6tJ98ZwspUUXkWYg1YRIGpvsXJNxqOtQRie0Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQrKLJUQJYuh5JIFnsQKUsfb+MQau7H1LEyiP6vjPMR1ZBtVWR
	cVs7wDneieiucLqUmA+n6Uzk11NotHeSzNQNaAsWuXX2DZWYaaJH/3QEUR0E5j+NJg==
X-Gm-Gg: ASbGncvcwWy+lV/iVScdSjneFmR49ddSLDw8t4HoPbmEpQtPjqAH5Gvnl2VdDd6Bo9l
	/MnXEEh8kVGqmKUHQdP+f/B8VWGiS70RU6/H46SS42nz7zc64EvhopLZqb3l609DA9QywN+K0X5
	aJ48c1HrW4uqGdGKpd9n8CrLuSXfc/1i4b3WCoGeSE8trno+mXu9F4HOew6cWNGRrWEJkrBbN+T
	7c9nMZcq4eyrLU/fJYbByg38HFnf3X9dG+BOfUPmqYwOv5XDdlM56jgHYwNlUxjtUGg6qoWM/Ii
	9DkYb2y3qVnWDkYxEPPAMe8tQ7N/D8KrkZyeXVHq7WjYnw+gihdQf0BQ6onjYIGT6KdR1P9ESew
	brAYOZmIgFY1KBHJmmNKGhbQ6gR6J5Gi9jClM4oFa1TFz0+pkloHZoCmdwUqlYshjAtbHndnZmx
	9jE1wlCQ+eIshi6qs=
X-Google-Smtp-Source: AGHT+IFsCw1bCj8/HsfuBMZZD8pEcSDfQxxlKagGV4XvKNFxpy1HQ2TTRQZEdkyv4BFKbjQ0850Wag==
X-Received: by 2002:a05:6214:3186:b0:704:8f24:f044 with SMTP id 6a1803df08f44-704f6af81efmr51856426d6.34.1752681497195;
        Wed, 16 Jul 2025 08:58:17 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799e874sm72296036d6.18.2025.07.16.08.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:58:16 -0700 (PDT)
Date: Wed, 16 Jul 2025 11:58:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
Message-ID: <d21dcce3-88ba-416c-9d18-ea47855c48fc@rowland.harvard.edu>
References: <8bec1698-5008-428f-8e71-ec002def0c54@rowland.harvard.edu>
 <6876b0ec.a70a0220.693ce.0019.GAE@google.com>
 <78c3fb66-c30f-4c64-a499-61c1665186a8@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78c3fb66-c30f-4c64-a499-61c1665186a8@rowland.harvard.edu>

Benjamin:

On Wed, Jul 16, 2025 at 10:29:38AM -0400, Alan Stern wrote:
> On Tue, Jul 15, 2025 at 12:50:04PM -0700, syzbot wrote:
> > Hello,
> > 
> > syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> > UBSAN: shift-out-of-bounds in s32ton
> > 
> > microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
> > microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
> > hid: s32ton: n 0 val 0 size 0x0
> > ------------[ cut here ]------------
> > UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
> > shift exponent 4294967295 is too large for 32-bit type '__s32' (aka 'int')
> 
> Benjamin:
> 
> Clearly there's going to be trouble when you try to convert a signed 
> 32-bit value to a 0-bit number!
> 
> My impression is that hid_parser_global() should reject Report Size or 
> Report Count items with a value of 0.  Such fields would be meaningless 
> in any case.  The routine checks for values that are too large, but not 
> for values that are too small.
> 
> Does this look like the right approach?
> 
> Alan Stern
> 
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git c2ca42f1
> 
>  drivers/hid/hid-core.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> Index: usb-devel/drivers/hid/hid-core.c
> ===================================================================
> --- usb-devel.orig/drivers/hid/hid-core.c
> +++ usb-devel/drivers/hid/hid-core.c
> @@ -464,7 +464,8 @@ static int hid_parser_global(struct hid_
>  
>  	case HID_GLOBAL_ITEM_TAG_REPORT_SIZE:
>  		parser->global.report_size = item_udata(item);
> -		if (parser->global.report_size > 256) {
> +		if (parser->global.report_size > 256 ||
> +				parser->global.report_size == 0) {
>  			hid_err(parser->device, "invalid report_size %d\n",
>  					parser->global.report_size);
>  			return -1;
> @@ -473,7 +474,8 @@ static int hid_parser_global(struct hid_
>  
>  	case HID_GLOBAL_ITEM_TAG_REPORT_COUNT:
>  		parser->global.report_count = item_udata(item);
> -		if (parser->global.report_count > HID_MAX_USAGES) {
> +		if (parser->global.report_count > HID_MAX_USAGES ||
> +				parser->global.report_count == 0) {
>  			hid_err(parser->device, "invalid report_count %d\n",
>  					parser->global.report_count);
>  			return -1;

This patch didn't work; the error message never showed up in the kernel 
log.  Nevertheless, hidinput_change_resolution_multipliers() tried to 
create an output report with a field having size 0.

How can this to happen without hid_scan_report() or hid_open_report() 
running?  It shouldn't be possible to use a report before it has been 
checked for validity.

Alan Stern

