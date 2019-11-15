Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9E2FE8DA
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2019 00:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfKOXvS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 18:51:18 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39468 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfKOXvS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 18:51:18 -0500
Received: by mail-pl1-f193.google.com with SMTP id o9so5736520plk.6;
        Fri, 15 Nov 2019 15:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=ZuTRCCNNApoUCcsjFMnHZOnUpX9/n99QXZNhF6/cJFs=;
        b=JHLxNt5IJDY5Ai90W/IYnVX09R4h4VG8ecgalM4jZqnXKMg1Q1Yj5XN6BoBYYpATAj
         8PnCCx+tO4d5SMykWQBLCJ5+5eqiCh0TVG4yehkTbblVJJ9ST4kRbgv+55NRbbCP1srH
         HEdNwr5ORddhREhrfYc8LCvYZZ9wnBilyE77Exi44P040mN2oV4u2B//uVKSwvozCp1Q
         noNCz1tmUryf05F6vWqPeOjfKZmjFBE/C5yoYDY7cWxcFBjZZ7DkuNV7KpiRGethgbvG
         pijenEWxHbwhCl/YlcL/ncHj8Mb3qVYg8k5k53phHosdwesEMVUiZVicIfo03MxkEHyw
         RkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=ZuTRCCNNApoUCcsjFMnHZOnUpX9/n99QXZNhF6/cJFs=;
        b=SEkRou0MIN3m/cigA8f5m4dKWlBLGe9lkj+oiXy9RmpbJEQ+Xnl83hGbGVeBbKLlDg
         be32ijJWQsngRFn/Hmj1rn1j20NnmQa/l86AbdXJTkS0KVVV2IJRUc63ikZk2SLFxo4G
         zLDJkLpNmU3Tb9vDX1A8L47djsirVJvDbPeouVLgqtkDNh0mij56lAmkJCvKbr7tFtrt
         44UieHfWHBqojZtj9lNlnhUSFXE+tB1fA6R2fnSfdNNAacuWcf09gxRt6Fg8uSjZR1vZ
         dPMzGNL+odmJ51/IGEzt3eJTAwX2dZKUN+PjzFqCPbKYaVyJw5mfPE7REfVYdDduZUnv
         JIDQ==
X-Gm-Message-State: APjAAAW/O+aVujztAVTR/on3790PPYGrusPmz1MVrsYywt3A+ZI564FS
        B//DRsH6ApD6a6xazBcnf08=
X-Google-Smtp-Source: APXvYqwl1Vf3utfTGfQqq7lgAQygD4v9icSRNkQ8R622rnnNF1hTj71IZ6ec6qmwje2vL5cOwpw7xA==
X-Received: by 2002:a17:90a:741:: with SMTP id s1mr23431410pje.107.1573861877169;
        Fri, 15 Nov 2019 15:51:17 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k6sm9143141pfi.119.2019.11.15.15.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 15:51:16 -0800 (PST)
Date:   Fri, 15 Nov 2019 15:51:14 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.4-rc7
Message-ID: <20191115235114.GA173184@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. A couple of fixes in driver
teardown paths and another ID for Synaptics RMI mode.

Changelog:
---------

Chuhong Yuan (1):
      Input: synaptics-rmi4 - destroy F54 poller workqueue when removing

Lyude Paul (1):
      Input: synaptics - enable RMI mode for X1 Extreme 2nd Generation

Oliver Neukum (1):
      Input: ff-memless - kill timer in destroy()

Diffstat:
--------

 drivers/input/ff-memless.c      | 9 +++++++++
 drivers/input/mouse/synaptics.c | 1 +
 drivers/input/rmi4/rmi_f54.c    | 1 +
 3 files changed, 11 insertions(+)

Thanks.


-- 
Dmitry
