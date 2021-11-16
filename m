Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6527453C4B
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 23:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhKPWkb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 17:40:31 -0500
Received: from outgoing-stata.csail.mit.edu ([128.30.2.210]:33697 "EHLO
        outgoing-stata.csail.mit.edu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232034AbhKPWka (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 17:40:30 -0500
Received: from [128.177.79.46] (helo=[10.118.101.22])
        by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.82)
        (envelope-from <srivatsa@csail.mit.edu>)
        id 1mn752-000ITj-B9; Tue, 16 Nov 2021 17:37:32 -0500
Subject: [PATCH v4 2/3] MAINTAINERS: Add Zack as maintainer of vmmouse driver
From:   "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To:     jgross@suse.com, x86@kernel.org, pv-drivers@vmware.com
Cc:     Zack Rusin <zackr@vmware.com>,
        linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
        sdeep@vmware.com, vithampi@vmware.com, amakhalov@vmware.com,
        keerthanak@vmware.com, srivatsab@vmware.com, anishs@vmware.com,
        linux-kernel@vger.kernel.org, namit@vmware.com, joe@perches.com,
        kuba@kernel.org, rostedt@goodmis.org, srivatsa@csail.mit.edu
Date:   Tue, 16 Nov 2021 14:40:49 -0800
Message-ID: <163710244541.123451.16673276883976304848.stgit@csail.mit.edu>
In-Reply-To: <163710239472.123451.5004514369130059881.stgit@csail.mit.edu>
References: <163710239472.123451.5004514369130059881.stgit@csail.mit.edu>
User-Agent: StGit/1.4
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
---

 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75a2c783ed6e..01c7d1498c56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20350,6 +20350,7 @@ S:	Maintained
 F:	drivers/misc/vmw_vmci/
 
 VMWARE VMMOUSE SUBDRIVER
+M:	Zack Rusin <zackr@vmware.com>
 M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
 M:	"VMware, Inc." <pv-drivers@vmware.com>
 L:	linux-input@vger.kernel.org


