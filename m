Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F603ED47A
	for <lists+linux-input@lfdr.de>; Mon, 16 Aug 2021 15:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhHPNBd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 09:01:33 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:47294 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhHPNBc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 09:01:32 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 3E52C21E63;
        Mon, 16 Aug 2021 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1629118860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=LZcYvKP3fKqG888iDvO787z29Bj4h7z0rCj5MqEN0PM=;
        b=ZTTl0fwVMcAh64e7OtLNbWXTeobIUZwsld1IwntIyI8cDZSVbJDsCvpujROIWgSRYjvsXz
        YPca4KlEZaR0ICYNnavvj6MM9XUMsEpVqWtvb5arG38vALgwA2vJkhRhoo8eLIK3wbwBs0
        swyU/v/guVSjLr0ufWQah7uNOnUgLJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1629118860;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=LZcYvKP3fKqG888iDvO787z29Bj4h7z0rCj5MqEN0PM=;
        b=E89pGcW1kdz3K7Ho9CATKs+IG89+Cm3RPWZxy46jaIgC25VUL99+hV32FTz1NNkiMSkZH+
        xJ7o5axl5XjM/nDw==
Received: from lion.mk-sys.cz (unknown [10.100.200.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 0127FA3B88;
        Mon, 16 Aug 2021 13:01:00 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
        id DBB766082D; Mon, 16 Aug 2021 15:00:59 +0200 (CEST)
Date:   Mon, 16 Aug 2021 15:00:59 +0200
From:   Michal Kubecek <mkubecek@suse.cz>
To:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [REGRESSION][BISECTED] flood of "hid-generic ... control queue full"
 since v5.14-rc1
Message-ID: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dfcrugjtzogdosw5"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--dfcrugjtzogdosw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

starting with v5.14-rc1, my kernel log gets flooded with messages

  hid-generic 0003:051D:0002.0002: control queue full

at rate of ~33 per second. Device 051d:0002 is an APC UPS (BR-650 VA).
I bisected the issue to commit

  7652dd2c5cb7 ("USB: core: Check buffer length matches wLength for control transfers")

Reverting this commit on top of v5.14-rc6 resolves the issue. I suspect
the problem is some missing cleanup when usb_submit_urb() bails out on
the newly added check but I'm not familiar enough with the code to see
what is missing or if the problem is on USB or HID side.

Michal

--dfcrugjtzogdosw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmEaYYUACgkQ538sG/LR
dpX7dwf+LxmPuDJNPaEYvkYFNTmEZFTaTJQTu2gPVihcZfOY2rwsgukq1pmpoKS3
y18U9cvJ8dWwpGLhSbgDUYcBW9sntNWFEiF1Chqp9KMlh96GecESESnNG1gFdTba
iEeatloqTTMO4BOqoQiEoipff7zM62uSlizVB2M6dY/I+BZ4FfY6+b/zYoMiWm4J
rGuxhV9JnkY72ksHj16CsIHbAMo8rJhm1nTf3UKogak/wLw/tYJYFiufO9O478pk
fx1tC0WS4rGt/2+33uW2JU6c3yuLmW/Jv/JgcKuOnrg1u0wfK1QxkiUBjuhAfxym
1ByJ1INJOKNgC4ff3+1jOstnHMMtug==
=hxJS
-----END PGP SIGNATURE-----

--dfcrugjtzogdosw5--
