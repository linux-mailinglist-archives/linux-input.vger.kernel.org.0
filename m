Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5747A1874C8
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 22:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732641AbgCPVfQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 17:35:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:44222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732567AbgCPVfQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 17:35:16 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC1DB20679;
        Mon, 16 Mar 2020 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584394515;
        bh=toHhrV6u5qgEDXy0LaW5D0UvCYLrvNF/F6k12esdyXM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=FS8POu0BNzZBf2ebz1uVdS26A6QlFskAUKzX/uMk0fFr5+FL+2s8cCk+3JHu8CXTN
         RAA3m61zVBfWuUnNejmh7WNUh/NZd5pOP3PLJz7Rmw+uuSdDd2KzYZL5wULOxuNI/H
         iMEmvW7yEAmxLqbS+tR86ich/dM60rjGLwJnth5Q=
Date:   Mon, 16 Mar 2020 22:35:12 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Tony Fischetti <tony.fischetti@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: add ALWAYS_POLL quirk to lenovo pixart mouse
In-Reply-To: <20200312161606.14133-1-tony.fischetti@gmail.com>
Message-ID: <nycvar.YFH.7.76.2003162235030.19500@cbobk.fhfr.pm>
References: <20200312161606.14133-1-tony.fischetti@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 12 Mar 2020, Tony Fischetti wrote:

> A lenovo pixart mouse (17ef:608d) is afflicted common the the malfunction
> where it disconnects and reconnects every minute--each time incrementing
> the device number. This patch adds the device id of the device and
> specifies that it needs the HID_QUIRK_ALWAYS_POLL quirk in order to
> work properly.

Applied, thank you Tony.

-- 
Jiri Kosina
SUSE Labs

