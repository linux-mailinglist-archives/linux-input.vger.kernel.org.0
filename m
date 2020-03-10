Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A7017F6BC
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 12:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgCJLxY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 07:53:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:43082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgCJLxY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 07:53:24 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2514524680;
        Tue, 10 Mar 2020 11:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583841204;
        bh=9Dqcrvid3TzQgZ9K1Vvw91iUzAv4QQy5lINcNKCa/so=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=sjCiWvrQsolPGGawdf8DitKDpTSHdufJ9q+aIS3KMYbySomPXkCgOtBchAWe09kWT
         paeMlaX3QMSvoon7YaHpUFg2Zm3VcIqdZGYsNh3YEdUsGv8C4dYcPyvWeOhmhmZbl4
         R1OvSiEkS5OqQly2085o8KQu/CmwGsBrKFH5wzR8=
Date:   Tue, 10 Mar 2020 12:53:21 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Tony Fischetti <tony.fischetti@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] add ALWAYS_POLL quirk to lenovo pixart mouse
In-Reply-To: <20200304164700.11574-1-tony.fischetti@gmail.com>
Message-ID: <nycvar.YFH.7.76.2003101251500.19500@cbobk.fhfr.pm>
References: <20200304164700.11574-1-tony.fischetti@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 4 Mar 2020, Tony Fischetti wrote:

> A lenovo pixart mouse (17ef:608d) is afflicted common the the malfunction
> where it disconnects and reconnects every minute--each time incrementing
> the device number. This patch adds the device id of the device and
> specifies that it needs the HID_QUIRK_ALWAYS_POLL quirk in order to
> work properly.

You are missing Signed-off-by: line here (please see 
Documentation/process/5.Posting.rst and 
Documentation/process/submitting-patches.rst to read what this is about).

Also, we generally prefix all the patches to HID susbsytem with 'HID: ' in 
the subject / shortlog, so as you'll be resending with signoff, could you 
please fix that up at the same time as well?

Thanks,

-- 
Jiri Kosina
SUSE Labs

