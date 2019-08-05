Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8C98190C
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 14:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfHEMTT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 08:19:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:57252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbfHEMTT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 08:19:19 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 790432086D;
        Mon,  5 Aug 2019 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565007558;
        bh=3Q5esvXq0CWoL7W90INsx+Q6lWIG4S8UxXmEnpAgG6Y=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=BepvGoCRHF2IJOjzs41tKN7vDCFKFXndKreFp1ugBwig1qVnsroNFMQa1//Ws4Y+c
         La54Dts48KQfF8uqxoF6FIvWX1wkak9Rqp92B0ACij8HLbiGq7zSTslAMrG2/WykCF
         rIIqN2pg1b2UPaJ1NRgM6rVNj7rXuR+qnEVaErJE=
Date:   Mon, 5 Aug 2019 14:19:14 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] holtek: test for sanity of intfdata
In-Reply-To: <20190725131333.26192-1-oneukum@suse.com>
Message-ID: <nycvar.YFH.7.76.1908051419020.5899@cbobk.fhfr.pm>
References: <20190725131333.26192-1-oneukum@suse.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 25 Jul 2019, Oliver Neukum wrote:

> The ioctl handler uses the intfdata of a second interface,
> which may not be present in a broken or malicious device, hence
> the intfdata needs to be checked for NULL.
> 
> Reported-by: syzbot+965152643a75a56737be@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Applied, thanks Oliver.

-- 
Jiri Kosina
SUSE Labs

