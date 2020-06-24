Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C465207A6D
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 19:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405524AbgFXRjc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 13:39:32 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21675 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405507AbgFXRjb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 13:39:31 -0400
X-Greylist: delayed 903 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Jun 2020 13:39:29 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1593019464; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=Z2LIGnKVhyC7eHxenvrxudt9I4J7HiRWu7Sl2izAjZyROd0P3rY88UZ9inlsqDMo2E0xfSn4n0QZoAYdGhT1xD9KdguEi8OKOhg3bqLlHAx4esGliqdXlzhc6OVDruFnAtHXCv5m/BGz6cTHExuiFMJIKCeahIM3P89V9bwyuIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1593019464; h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=0ZxMa2VKVh77iHBQBlLUqstOg+WSkJcSoOdkmqnh4mM=; 
        b=Xam4suRjaa1CDEe8LCCsa4E4Sl2F+CFaVbDzGG1DB8icn/O1pR3zBwaWeUyw2GcteANUDwpf5nTlT+CjaNTxUNTa8uPY2DB8GpEFTWU7kHsfGJ7BR4TuGvvMDLecrw41po2+o/w3unMrVjfsNyLpcSaLIta1LCvom3DEKPZG/j4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=devnull@uvos.xyz;
        dmarc=pass header.from=<devnull@uvos.xyz> header.from=<devnull@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-215-220.hsi15.unitymediagroup.de [95.222.215.220]) by mx.zoho.eu
        with SMTPS id 1593019462976587.6885587340986; Wed, 24 Jun 2020 19:24:22 +0200 (CEST)
Date:   Wed, 24 Jun 2020 19:24:22 +0200
From:   Dev Null <devnull@uvos.xyz>
To:     linux-input@vger.kernel.org
Subject: Filtering an entire sieries events enclosed by a SYN_REPORT
Message-Id: <20200624192422.accd7259f5333684998f06df@uvos.xyz>
Organization: UVOS Organization
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, 

Im writing a driver for buttons permanently located on touchscreen surfaces outside of the main display area sutch as seen on most android devices designed for android <2.3 (google an image of a motorola atrix 4g for an example). This works by attaching to a input touchscreen device and sending a EV_KEY event if a touch lands on a button by matching simultaneous ABS_X ABS_Y and BTN_TOUCHSCREEN events to an arbitrarily defind map of rectangels with assigned keycodes, the WIP module can be examined here: https://github.com/IMbackK/droid4-linux/blob/virtual-buttons/drivers/input/misc/touchscreen-buttons.c

I would also like to filter the events which land on a button, so that userspace dose not react to touch events on these buttons. However an input_handler filter handler is not sufficant for this purpose beacause i have no way of knowing if a touch event belongs to a defind button until the touchsreen driver has sent SYN_REPORT. I have tried to filter all events, while saving them and then reemmiting them by calling input_event() on the input_device of the touchscreen driver, this however crashes the ts driver. This also seams like a very hacky solution even if it where to work.

1. Is there some method to filter an entire sieries events enclosed by a SYN_REPORT?
2. Is there a good way to inject events to a input_device owned by another dirver?
3. Is there any other recommended method to satisfy the above requierments?

-- 
Dev Null
