Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FBD279C56
	for <lists+linux-input@lfdr.de>; Sat, 26 Sep 2020 22:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgIZUYV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Sep 2020 16:24:21 -0400
Received: from mga05.intel.com ([192.55.52.43]:60140 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726242AbgIZUYV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Sep 2020 16:24:21 -0400
IronPort-SDR: ZL6deB9UA14dhp11/+T73TXguEzVsqc+qBkGJxgEsqAoX2IAepM2mrovelxE9GNaJmLG8A7C9L
 ySAcvhrxhGGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9756"; a="246556142"
X-IronPort-AV: E=Sophos;i="5.77,307,1596524400"; 
   d="scan'208";a="246556142"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2020 13:24:20 -0700
IronPort-SDR: MkjbGTQf8ZvdnGNqqKmVEBunAm8/EDhFHKuaE2/7Yc2KlhrZBQ0Jk2Gzjo6pqNjRvfdvYX+8Ed
 vPMDE71b4cdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,307,1596524400"; 
   d="scan'208";a="311274152"
Received: from lkp-server01.sh.intel.com (HELO 2dda29302fe3) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Sep 2020 13:24:18 -0700
Received: from kbuild by 2dda29302fe3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kMGjx-0000ZI-Tb; Sat, 26 Sep 2020 20:24:17 +0000
Date:   Sun, 27 Sep 2020 04:23:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     kholk11@gmail.com, dmitry.torokhov@gmail.com
Cc:     kbuild-all@lists.01.org, robh+dt@kernel.org, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [RFC PATCH] Input: nt36xxx_memory_maps[] can be static
Message-ID: <20200926202356.GA33239@2adff5953e79>
References: <20200926124747.12465-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926124747.12465-3-kholk11@gmail.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 nt36xxx.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/nt36xxx.c b/drivers/input/touchscreen/nt36xxx.c
index 2434c1ac880899..c5c3ba643ce5e4 100644
--- a/drivers/input/touchscreen/nt36xxx.c
+++ b/drivers/input/touchscreen/nt36xxx.c
@@ -14,7 +14,7 @@
 
 #include "nt36xxx.h"
 
-const struct nt36xxx_mem_map nt36xxx_memory_maps[] = {
+static const struct nt36xxx_mem_map nt36xxx_memory_maps[] = {
 	[NT36525_IC]  = { 0x11a00, 0x10000, 0x12000, 0x14000, 0x14002 },
 	[NT36672A_IC] = { 0x21c00, 0x20000, 0x23000, 0x24000, 0x24002 },
 	[NT36676F_IC] = { 0x11a00, 0x10000, 0x12000, 0x14000, 0x14002 },
@@ -22,7 +22,7 @@ const struct nt36xxx_mem_map nt36xxx_memory_maps[] = {
 	[NT36870_IC]  = { 0x25000, 0x20000, 0x23000, 0x24000, 0x24002 },
 };
 
-const struct nt36xxx_trim_table trim_id_table[] = {
+static const struct nt36xxx_trim_table trim_id_table[] = {
 	{
 	 .id = { 0x0A, 0xFF, 0xFF, 0x72, 0x66, 0x03 },
 	 .mask = { 1, 0, 0, 1, 1, 1 },
