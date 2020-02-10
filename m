Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08ED91570BD
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2020 09:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBJIV1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Feb 2020 03:21:27 -0500
Received: from mail-io1-f41.google.com ([209.85.166.41]:43132 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgBJIV0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Feb 2020 03:21:26 -0500
Received: by mail-io1-f41.google.com with SMTP id n21so6556999ioo.10;
        Mon, 10 Feb 2020 00:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=6f+qi7dpQ9dAnUohkOS6K1cHu/QmF346SAMV5H3UnC0=;
        b=J1qKydLSxIWTX3wWnPEzSSWhu7fsmH8CemAkEXUGPvAtVhEsSW1h0Jxw10fgssMs5j
         Zf5oGh6aZypevGnCdgr4S4F8tuDsmxTfGUdKnsH5d5Uovw4oquPf26Z/BE7J1pPzlG9B
         qKHpxIJguVgqjP23BQDseuqjXrYOJrg7I/4PxDKd7G4Wni/f81EKbLv+gC02xvfIaYUY
         HR2attiHwVs2PFKh7cdFeZKu5f+i6Z9KCDHcIUSfRjJycuIZG2DOiq8+7VCgpQpIoVx7
         JVSllME+aW2WGgBjdT2xSUwI5dbG5476lUvn93XYk/IbBgLhZ5lRXK0INZ/lFSRXrr0r
         QiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=6f+qi7dpQ9dAnUohkOS6K1cHu/QmF346SAMV5H3UnC0=;
        b=GnsHMHGLC1ZbW9HBaCoeUFC6z57tjf8ZP0/kawQH1U85ah+eskVSfr5x5/Q2wjGwPm
         JDddYL8x4lODI6TFk8+tD4DKrzTITLZ7teQGPmBkp3QDvqTx6PdLQ0F+tA2fZTFp4A/1
         xqIb1yNJkRHb6Hxr5qUnxZzba9tkQCpcEVNpPLKb55k4r+hkthf7N8c9ex4m0h+zerEN
         EYf6NT1ReQJM4YW1VDPDA/GSHjX8X2/zWfn1soAPcmMlxl0BHAANcsa/dkTrsRd2P2Sy
         DbbdF6GV4wyO0BzUcxkwDTlpMbGVWkdcFP/tN0iRoId1mJ4vVpUO58nU5OGGZwbHAcn8
         Hjxw==
X-Gm-Message-State: APjAAAXfsJKu0nEUvFd3ORIH32/D+bz9m74l9MEGhSslWz7JJDVrnbuF
        kRDSask8fn7ByvTCyBbEeqSwI6ZltWfkvAfNmwP4P2sBffI=
X-Google-Smtp-Source: APXvYqxKzP1C5Mdoq7PtTCKbU/y9VLzvZ8FoFa+Oh+4Za8oSyFlh8tM+m+gXyLz/HADSua0I2d1hEWF6z1QeNzaEylE=
X-Received: by 2002:a5d:9dc5:: with SMTP id 5mr8396812ioo.111.1581322885754;
 Mon, 10 Feb 2020 00:21:25 -0800 (PST)
MIME-Version: 1.0
From:   Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date:   Mon, 10 Feb 2020 13:21:15 +0500
Message-ID: <CABXGCsMfzj+mpjvuZifzWEKbX7X36v7iMVPampSS6kOc2Hzoow@mail.gmail.com>
Subject: [BUG] Kernel log flooded by message "logitech-djreceiver
 0003:046D:C53A.000C: logi_dj_hidpp_event: invalid device index:7"
To:     Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Kernel log flooded by message
logitech-djreceiver 0003:046D:C53A.000C: logi_dj_hidpp_event: invalid
device index:7
This happens when the mouse is idle.
And it started since I begin using the mouse pad with Power Play technology.


Kernel ver: 5.6 pre RC
--
Best Regards,
Mike Gavrilov.
