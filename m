Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F60330AEA
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 11:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhCHKNs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 05:13:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:60696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231221AbhCHKN3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 05:13:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88CA764EB0;
        Mon,  8 Mar 2021 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615198409;
        bh=Unp6XPH9RG9hQOcjeXcfQb5q8ixqi76G4o5/jyRdULM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=DSXwZR9mm1Ez561DafLCUSNA7cQk9g0KT97Ss2PUNgf5NePSUbnR1SVPDyfNQ/ayY
         2HajSxR0VJMSjM06vRrn4T9jautKQO4ZNUtulMQAerKE7SUbksRQQwm7ALl7ka4Nck
         jyBKbnb7gg88w1vOYTAJRKObEKE+9zp4m3hmieO+8qPm92sKN6O9WXzBJmQSXTn3hI
         qVs25WaNdpG1qoQEFIGB/9jve8y/Ro6stIgYRReHS99jvhSqnXqtfnGOccicHzS8Bz
         Jel2PW6dRPzx16dN6LfEv1IvZPfZFT4LOAr9XaIg/ClAy7ScJrr/NzizgFDCRUyawa
         Xeyw7laaaCN2Q==
Date:   Mon, 8 Mar 2021 11:13:26 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jason Gerecke <killertofu@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] HID: hiddev: Return specific error codes on connect
 failure
In-Reply-To: <20210211193059.70291-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2103081113180.12405@cbobk.fhfr.pm>
References: <20210211193059.70291-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 11 Feb 2021, Jason Gerecke wrote:

> The only caller of this function only cares about gross success/failure
> but we still might as well resolve the following smatch warning and fix
> the other error paths as well:
> 
>     hiddev.c:894 hiddev_connect() warn: returning -1 instead of -ENOMEM is sloppy
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>

Applied, thank you Jason.

-- 
Jiri Kosina
SUSE Labs

