Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71C828B2FF
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 10:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfHMIxp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 04:53:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:58282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728230AbfHMIxk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 04:53:40 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E229B20844;
        Tue, 13 Aug 2019 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565686420;
        bh=3hCFV7N7mHCA6p3dZJyYw5U5Fm1fl7p+V5+X3dQsqqg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=oUHFCd7N+/0HOaPNroAPadhDTCtw3t3NcTsPzYaqn23eLGS0HEcpSWhDgcUMNGcqd
         VB1szvXFSUQRXKtcNmgfO84iAwVF6zJU7AQbayyx08Llzy1CEs3CgXyYc37SPyMvny
         3vv9vZa91JbTbR0ONIzWK1Qa+UVvArYP7cYIxrbw=
Date:   Tue, 13 Aug 2019 10:53:32 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Aaron Armstrong Skomra <skomra@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        ping.cheng@wacom.com, jason.gerecke@wacom.com,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: Re: [PATCH] HID: wacom: add back changes dropped in merge commit
In-Reply-To: <1565636152-21942-1-git-send-email-aaron.skomra@wacom.com>
Message-ID: <nycvar.YFH.7.76.1908131053030.27147@cbobk.fhfr.pm>
References: <1565636152-21942-1-git-send-email-aaron.skomra@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 12 Aug 2019, Aaron Armstrong Skomra wrote:

> Merge commit 74acee309fb2 ("Merge branches 'for-5.2/fixes', 'for-5.3/doc',
> 'for-5.3/ish', 'for-5.3/logitech' and 'for-5.3/wacom' into for-linus")
> inadvertently dropped this change from commit 912c6aa67ad4
> ("HID: wacom: Add 2nd gen Intuos Pro Small support").

Mea culpa maxima, thanks for catching this. Now applied to 
for-5.3/upstream-fixes and I will be sending it to Linus this week still.

-- 
Jiri Kosina
SUSE Labs

