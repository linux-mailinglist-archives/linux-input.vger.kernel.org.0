Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B0666B1DD
	for <lists+linux-input@lfdr.de>; Sun, 15 Jan 2023 16:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjAOPJP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Jan 2023 10:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjAOPJO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Jan 2023 10:09:14 -0500
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFA87ED1
        for <linux-input@vger.kernel.org>; Sun, 15 Jan 2023 07:09:12 -0800 (PST)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 876821EC042F
        for <linux-input@vger.kernel.org>; Sun, 15 Jan 2023 16:09:11 +0100 (CET)
Received: from deliver ([unix socket])
         by localhost (Cyrus v2.4.17-caldav-beta9-Debian-2.4.17+caldav~beta9-3) with LMTPA;
         Sun, 15 Jan 2023 15:19:22 +0100
X-Sieve: CMU Sieve 2.4
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPS id 0FED41EC0513
        for <bp@alien8.de>; Sun, 15 Jan 2023 15:19:22 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89C0260C8E
        for <bp@alien8.de>; Sun, 15 Jan 2023 14:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6E54C433F2
        for <bp@alien8.de>; Sun, 15 Jan 2023 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673792359;
        bh=8QG0LoL5mJCyDTNQGeLr5sOqIRFyOE9VEs16f7QMd8w=;
        h=From:To:Subject:Date:From;
        b=ZIMrtcltaahxv+JPXwAlVIU5cCpsYnCep12iu5Kw9Qq1PVNdUGErgy7v0LRfz2Zlc
         QGMlh/nhVEnRyPAWNljdZ3mHb+4/HHiDUXoSDRKtxELLY6QE+TiscZx2goTcU54TZC
         M4rPMfCNgujs3o8gbhVtIQOi9norGDMgDf3YeATblTk9v/q0immdYZG3LH7twjTpBw
         gl8Tbhl52eBRb0ShmFcwA253YNzUJMyTMsRXdSSUcd3TBOXljm7ZybNpmg76JN1euL
         ndU8C/cO3PH46Hl1/i27+r6lUos+tljVJFriOwuuodAKhR3m4WEDWazwL5LvYXmObv
         ONKTkExJHpPiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D183AC43145; Sun, 15 Jan 2023 14:19:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     bp@alien8.de
Subject: [Bug 216933] New: brightness keys not working on Lenovo ideapad 3
Date:   Sun, 15 Jan 2023 14:19:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_x86_64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tuxuser@quantentunnel.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_x86_64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216933-6385@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Authentication-Results: mail.skyhub.de;
        dkim=pass header.d=kernel.org header.s=k20201202 header.b=ZIMrtclt;
        dmarc=pass (policy=none) header.from=kernel.org;
        spf=pass (mail.skyhub.de: domain of bugzilla-daemon@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=bugzilla-daemon@kernel.org
X-Spamd-Bar: --------
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216933

            Bug ID: 216933
           Summary: brightness keys not working on Lenovo ideapad 3
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 6.1.5
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: x86-64
          Assignee: platform_x86_64@kernel-bugs.osdl.org
          Reporter: tuxuser@quantentunnel.de
        Regression: No

System: Lenovo ideapad 3
OS: openSUSE Leap 15.4, all updates installed
Kernel: 6.1.5, 5.14.21-150400.38-default

Brightness keys are not working. When pressing these in kde plasma no
brightness increase / decrease indicator is shown.
The brightness system itself is working: When changing the brightness using=
 the
plasma battery applet, the brightness changes as expected.

Changing to runlevel 3 showkey and evtest don't respond to pressing these k=
eys.
They only respond to other keys.
evtest displays
/dev/input/event1 is Video Bus
Here it displays Event code 224 for KEY_BRIGHTNESSDOWN and Event code 225 f=
or
KEY_BRIGHTNESSUP. But pressing the buttons leads to no response.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
