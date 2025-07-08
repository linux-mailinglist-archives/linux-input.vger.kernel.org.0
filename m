Return-Path: <linux-input+bounces-13421-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4206AFCDB7
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 16:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22EC31885E12
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 14:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B992BE7B1;
	Tue,  8 Jul 2025 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gX6aG95p"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CA02DFA3C
	for <linux-input@vger.kernel.org>; Tue,  8 Jul 2025 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751985185; cv=none; b=C9d5JCwxUjZs2H2TGLYt+2BAQHdrnKsrK8+eYeBKBuu+b+yrQe8bUQ1FVVKQ/8D524vgdwa2yGX3fC9Do55OV0Gqg59WHUoC2Gme0ms3sC9Tvyh2ua5lzh5MFnE3khc/L4sz+6vGmo7KkGoy8LXJp3Rb9bBtbVSdXPfW78DCTdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751985185; c=relaxed/simple;
	bh=9gJZ9P5U2B5/nhjex3FiPp/yJQqM7d/SqS6PCkuUsv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ablg1gyTure8c/XNT8F/98bZ4wQw3w0cEOYgHVlghNo9Z/f6W25iAlqw1zO344NIjZIc1qLKZccX0ePjqez156AibIozOWAq4MRFZTek2TLWI0bagR8iaHge4zBt1AqO6s5DI7TaaEXOZmouXfsW4HLEBnveBPAhDr1yT+Mp2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gX6aG95p; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a98208fa69so55051301cf.1
        for <linux-input@vger.kernel.org>; Tue, 08 Jul 2025 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751985182; x=1752589982; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkJTXQkSLDM+H3JzJZs9zJqYDllZ/dGQLsPeP5e4naI=;
        b=gX6aG95pi4qvjXu2CmP4RIsuOhX/dFY3QETxxjwMMP9Bg7O/yaXryAH6iMcKAKjlf/
         OF4hjqP0DsHByrtjnMo985jjvmPQiVN6dzkSgHJc/7Oi9Zw2HRGhzETwpcy+nU9oU4PD
         CkjUslEVxUX7Aau3OCssff+aweYElGb9ntpZFPpUp5IFF/nhyccmlYmQYgTyfxY2LxqU
         GAdW6IKKZBYtSROs9mCcyzIA3uf8PjdxWx1eJgaYGlJCK7b36IhWb02surCnTMx2YDuX
         js9lKAgyPpxPuMl1QlB5zIyRTMohwuRoP6uC6WaHDCM7RIb17YP+UQcV/ISlaL3TsPf9
         Tvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985182; x=1752589982;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkJTXQkSLDM+H3JzJZs9zJqYDllZ/dGQLsPeP5e4naI=;
        b=AHuBDPsHUUxuel2BcF/vkTx580zrTo0tOWErlUPHBgMY32OHrsWitVNe4TWdsdmHh3
         9Do5VlyjsOB1RAHXQF9avd3erOoBY2GKuytuqPUgTJ5T51PT4Tz9auGze4cPSuwEOQnQ
         to/cMstQASPXsFzZbDXM8F37luNWuhfb1b55XversCiEk5hqbyIM7EgB0VMtpnW5+tMX
         dRfZku+qOzA4MD5rdYFHbvTsAuQfTFjUL4SHrhVuJpW1/GY99VQGl79U4b4SIrkI1sdL
         rQftiLVK156MQpz+RCyqCRaKi7w4b2g0bkL9De1Z3ZciLeVvdoxPclcsPUaL9Lho9R3o
         sS4Q==
X-Gm-Message-State: AOJu0YzJgAe68ZmDa05o4pX833rP6PAHEsUWdqsFJL8EKgBkeVNVOd47
	pq/yKpkTnLwmgzhV458a28o6wb2e+D16S27aL+tXs0/K62NLdK3kPeQb8vFtDlUQO6ykczZ9HRS
	iD84=
X-Gm-Gg: ASbGncupEIWYoVyZGsiRHUTKORx2xFjxloSQ+uyabbYfXvKptJord2WPaeuuClqM7w3
	qOtzwK+uCEoIT2EXg7f9g8dmM6aQ1ELz85zcOz0w3rQgPOfMMMo5+i2uGTJzD4/6fnJfMc7UqxE
	W8SrwKLl+xMhnNkAbPJ3qmGFYd9DP31gIWG79/qzEBOs36UadZQeUJl7jRrEmSYEGwOtcliUQls
	N9jPrMyhr09l047ilORLxvFsEJ9UyQqjldQkZxA4Z6VIuZdyjD6cTbXTHa1tyya4y/8TASpd4rd
	KrDKX6qRBoP6FMF0fBwwfUInK34TgJj+SOx+paSbysvNkZiNtMwFLj9wwHen6N/DiE5ZYSruoRi
	Kw5Hzjma959024+A=
X-Google-Smtp-Source: AGHT+IF12A4YzQxhASZJw3qucM2mtdDIrnVfX1CGv4cPHFWrrPOlNBqHO3i9JOSTmOyqi0e0jaMeZw==
X-Received: by 2002:a05:622a:98f:b0:4a9:8232:cb35 with SMTP id d75a77b69052e-4a9ce5bb4c0mr45895881cf.15.1751985182246;
        Tue, 08 Jul 2025 07:33:02 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994aa9413sm80080391cf.78.2025.07.08.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:33:01 -0700 (PDT)
Date: Tue, 8 Jul 2025 10:32:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Serious bug in HID core
Message-ID: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Jiri and Benjamin:

Investigating a recent bug report from syzbot 
(https://lore.kernel.org/linux-usb/686be237.a70a0220.29fe6c.0b0c.GAE@google.com/)
led me to a rather serious error in the HID core.  It could affect a 
lot of drivers, and I don't know enough about them or the HID subsystem 
to fix it right away.

In short, does the value returned by hid_report_len() count the byte 
reserved for the report ID number?

Some drivers seem to assume that it does and some seem to assume that it 
doesn't.  Here's what the actual code from include/linux/hid.h does:

/**
 * hid_report_len - calculate the report length
 *
 * @report: the report we want to know the length
 */
static inline u32 hid_report_len(struct hid_report *report)
{
	return DIV_ROUND_UP(report->size, 8) + (report->id > 0);
}

It's somewhere in between -- it includes the ID byte in the count if and 
only if the ID is nonzero!  And of course, this behavior isn't mentioned 
in the (ungrammatical) kerneldoc.

The particular scenario causing the bug found by syzbot was this: 
report->size was 0, report->id was 0, and the lower-level driver (usbhid 
in this case) assumed that the length argument (which was 0) did include 
the ID byte.  Since the ID was 0, the driver skipped over the first byte 
of the buffer and decremented the length, causing the length to 
underflow and leading to an invalid memory access.  In a more realistic 
setting, this would merely result in data loss and leakage.

How should this be fixed?

Related issue: When the lower-level driver's raw_request() routine is 
called, can it assume that the first byte of the output buffer always 
contains the report ID number, set by the HID core?  If not, should it 
assume that the first byte is always reserved for the ID, or that the 
first byte is reserved only when the ID is nonzero?

Do __hid_request() and __hid_hw_raw_request() behave the same way in 
this regard?

Alan Stern

