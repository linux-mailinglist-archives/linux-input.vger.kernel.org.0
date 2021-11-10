Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C156D44CA10
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 21:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbhKJUIV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 15:08:21 -0500
Received: from outgoing-stata.csail.mit.edu ([128.30.2.210]:50507 "EHLO
        outgoing-stata.csail.mit.edu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230230AbhKJUIU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 15:08:20 -0500
Received: from [128.177.79.46] (helo=[10.118.101.22])
        by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.82)
        (envelope-from <srivatsa@csail.mit.edu>)
        id 1mktqd-000YWI-51; Wed, 10 Nov 2021 15:05:31 -0500
Subject: [PATCH v3 2/3] MAINTAINERS: Add Zack as maintainer of vmmouse driver
From:   "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To:     jgross@suse.com, x86@kernel.org, pv-drivers@vmware.com
Cc:     Zack Rusin <zackr@vmware.com>,
        linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
        amakhalov@vmware.com, sdeep@vmware.com,
        virtualization@lists.linux-foundation.org, keerthanak@vmware.com,
        srivatsab@vmware.com, anishs@vmware.com, vithampi@vmware.com,
        linux-kernel@vger.kernel.org, srivatsa@csail.mit.edu,
        namit@vmware.com, joe@perches.com, kuba@kernel.org,
        rostedt@goodmis.org
Date:   Wed, 10 Nov 2021 12:08:45 -0800
Message-ID: <163657490344.84207.11803468380735093749.stgit@srivatsa-dev>
In-Reply-To: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>

Zack Rusin will be taking over the maintainership of the VMware
vmmouse driver. Update the MAINTAINERS file to reflect this change.

Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
Acked-by: Zack Rusin <zackr@vmware.com>
Cc: linux-graphics-maintainer@vmware.com
Cc: pv-drivers@vmware.com
Cc: linux-input@vger.kernel.org
Cc: stable@vger.kernel.org
---

 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0329d67c5bcf..21c0e49b80b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20079,6 +20079,7 @@ S:	Maintained
 F:	drivers/misc/vmw_vmci/
 
 VMWARE VMMOUSE SUBDRIVER
+M:	Zack Rusin <zackr@vmware.com>
 M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
 M:	"VMware, Inc." <pv-drivers@vmware.com>
 L:	linux-input@vger.kernel.org

