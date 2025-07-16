Return-Path: <linux-input+bounces-13558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B6B07810
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 16:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 246C2175689
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 14:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACA424468D;
	Wed, 16 Jul 2025 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pjtQlq8I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F145218589
	for <linux-input@vger.kernel.org>; Wed, 16 Jul 2025 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752676184; cv=none; b=rfmf7xWygj1HCPPys7pZJ7qF75+3CC8tt2IjOZ/Orf8pVYLuiH8oUpqDX+1FRziJlIUKL34Y5lRnnvPf81JQr8p9O3OhCnFgFIp8oLsMrLcueKEpZcSru3XxWAMw+P5X5tVwiGMu8XDyjLWWrB0IooxIxfhCtlY5+ogFzx+lZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752676184; c=relaxed/simple;
	bh=eKUmlpIGboQT6S5Ovz6KOSqf2T5cj+mftR73RhnZT+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjL6RQd3VrdhJRB7zfz+f2hKNHpTdLLoywxM9g5NQ+vuaYDFKPvm2aDnqXdyzEeD6wdfdCSMngg9ZzBRCHCkM8xOMLUlvqPAkacGS/KphLYpXZi2/aGMnzSWVBSnwmNXHm6cXrRftCxZ/49MkjxLw2TaVLF458Zd9VWaZ5YXOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pjtQlq8I; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e346ab53d8so52675385a.0
        for <linux-input@vger.kernel.org>; Wed, 16 Jul 2025 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752676181; x=1753280981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qt9z7TyyvFxzc9Zi5QX61Y9RbsiY23u8uaORF/jvc7k=;
        b=pjtQlq8IX8EaOxjjDRdPRgI92utzhFKWca+2epJjYzCqL0ml1OceuruNYv4YPrvlwj
         nr3BlrXUyZFovuHUUIKtEGWsfI0RF9Wm98suBLvLCYZ5X8UrVoemUel8DjqfVdl7GgUS
         qNN3mslKO70h9htLfkMcY+XP9lm4eJbtWoxPyjUPUzILHZF2Q42vRavSxYglC5pilLz/
         TYZgkAE2JqMee654L65PhAebhTI4+aNW1pw/stRveuurM3+JKc860CZ5wYxaegQfyvE1
         tcQkZDC0EgBxFGdcKGnZCLYEIXfSF1XDpsq+JBcGAX9jp1X/DtTAUTVGS9FOLjLGliN6
         Q2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752676181; x=1753280981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt9z7TyyvFxzc9Zi5QX61Y9RbsiY23u8uaORF/jvc7k=;
        b=gBHS1lD+u78eqD+8jFbPM0rhAUwkAcMBdVVrF35YOyNGVnhxRWWtFtSO24pYJnDt5e
         Wgj/daZrEv8ycGaTOVz1vTLbl4W9A7MnpFZBrjwM0IB/2Tg9kQrhM6UZKhJ+pcLt93X4
         xxJeodmOGXg2M0EfUzp46PBZG6ASOGT26gFZHmLez1s2pGRSlA2A4h9j17y0BOR5E9li
         qosqkVSF4nFbPStca88sxdF+hFjdbc7dqYXmpQpVEz+B+tX7GoPyMKB0q9135wUaLReo
         N37MFtpvZLdVqEuV+INN/TnME9bTNpJPj9+l6Jf/8w6y6CFOG8TKs5oZRCtFKYKusNfi
         JG2w==
X-Forwarded-Encrypted: i=1; AJvYcCVNd6dKyfPioRGIf6atSrbfB8e5xjA2mmddrvdApN6BquiFfRwmn/1lJwabaxT+/HXGhzY/+3ArAOzQNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA0UJXpKq0Ivz46A8ge+YDdW+w8Z0mhnlBN62mlI5b3r2r5dhG
	s3Of4ijyYuEtgJT59r28MCB6x3JbayHYx0YtaVE8W+0rHsE7H38s2cmpRWhsPYRmCA==
X-Gm-Gg: ASbGncstIdOj86fFZ8JqgZ8m8ri3r8SaceIXYP7G4MrdQc/R5MDXwTjBbpOJ0ZZcISE
	5KRmxoW6MY9O8Ysk+Ur7CkHP2RgXAUcssuSv/AUK72q32VAobtdcS+uLDP8ZPSuE3kPVQNgq2uO
	2MnSGEJNOpEgbUjwhtVTR6gcgg4BKHj1C6yZVclNG6BQ/YdV7XmGMu5pAhUye4jwvoqvbsvQXC0
	MjfKt5VIn2Gie5zlH3w7chcTpPF+oGwB08vUjS1yCmCjgNw+tCUDbRnVjjkOs7JU84l1URh3tKM
	j/FoJUlZvj+s45u74Tbc016Vpuj4T9GXhQ4yoqCq8shU80ajaQiJouRFgdV3rwc1yOYNfELuK+Z
	JocqxsMJlq0wDs7/DWmbhrz8EYzwE/Qw/Xj5iyxIm
X-Google-Smtp-Source: AGHT+IF3xlSqjICIE4by+UPGer4acYrJ4z0g+fjVRC6/rj7+8rf0BJhYUp+VmTOPflFKpHho7TjrBQ==
X-Received: by 2002:ad4:5cec:0:b0:704:7dbd:d991 with SMTP id 6a1803df08f44-704f4a9a406mr57966406d6.31.1752676180409;
        Wed, 16 Jul 2025 07:29:40 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39c9dsm70452096d6.66.2025.07.16.07.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:29:39 -0700 (PDT)
Date: Wed, 16 Jul 2025 10:29:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
Message-ID: <78c3fb66-c30f-4c64-a499-61c1665186a8@rowland.harvard.edu>
References: <8bec1698-5008-428f-8e71-ec002def0c54@rowland.harvard.edu>
 <6876b0ec.a70a0220.693ce.0019.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6876b0ec.a70a0220.693ce.0019.GAE@google.com>

On Tue, Jul 15, 2025 at 12:50:04PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> UBSAN: shift-out-of-bounds in s32ton
> 
> microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
> microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
> hid: s32ton: n 0 val 0 size 0x0
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
> shift exponent 4294967295 is too large for 32-bit type '__s32' (aka 'int')

Benjamin:

Clearly there's going to be trouble when you try to convert a signed 
32-bit value to a 0-bit number!

My impression is that hid_parser_global() should reject Report Size or 
Report Count items with a value of 0.  Such fields would be meaningless 
in any case.  The routine checks for values that are too large, but not 
for values that are too small.

Does this look like the right approach?

Alan Stern

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git c2ca42f1

 drivers/hid/hid-core.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -464,7 +464,8 @@ static int hid_parser_global(struct hid_
 
 	case HID_GLOBAL_ITEM_TAG_REPORT_SIZE:
 		parser->global.report_size = item_udata(item);
-		if (parser->global.report_size > 256) {
+		if (parser->global.report_size > 256 ||
+				parser->global.report_size == 0) {
 			hid_err(parser->device, "invalid report_size %d\n",
 					parser->global.report_size);
 			return -1;
@@ -473,7 +474,8 @@ static int hid_parser_global(struct hid_
 
 	case HID_GLOBAL_ITEM_TAG_REPORT_COUNT:
 		parser->global.report_count = item_udata(item);
-		if (parser->global.report_count > HID_MAX_USAGES) {
+		if (parser->global.report_count > HID_MAX_USAGES ||
+				parser->global.report_count == 0) {
 			hid_err(parser->device, "invalid report_count %d\n",
 					parser->global.report_count);
 			return -1;


