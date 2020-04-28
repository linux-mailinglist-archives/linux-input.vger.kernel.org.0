Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6706F1BCF2B
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 23:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgD1VyH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 17:54:07 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:60615 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgD1VyG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 17:54:06 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MCb2L-1jLXg80zTf-009eZu; Tue, 28 Apr 2020 23:53:39 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nick Crews <ncrews@chromium.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jiri Kosina <jkosina@suse.cz>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hid: intel-ish-hid: avoid bogus uninitialized-variable warning
Date:   Tue, 28 Apr 2020 23:53:29 +0200
Message-Id: <20200428215337.4094575-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2FKBEa32wyJPA0mE8M/M1O47fPCgP45rg2E7G9JyGaGIAZXxfsY
 MH9dZNJMaC76Sxk0dd77zKlBp9RJ6OsxkJF1c6nSns+Oh02YIMMOygA5U89nDK+EmQsntnl
 0A5oHhCh2RmkUS00EreoOntTKj2hwg6+lmxV0etXvuyrR7EektDviCafwKYqMSlZbG8CMep
 khZTfzTLQjngBifC+CyfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yAEbmVLzEWw=:hRDnaNEXdyARuZImKascUC
 R7qX0iopfno5voQFTOTGV6MgxRV/WV8m4Uhte+QEuPuXy/b8MdDPvTNPm3X+uthzg2dpMDXxO
 YhrvC9Cme7hQOGTI1dd0lGfRPqD7xQ8aM+VwUNjf0hAi+rscafk8KUfWCHGIXKmlpa9MtMBc3
 fggZTxvE/J87SP4GvB1cAuhAm6pbMyCXIRp/cpEXVxBcb6MwDNcLlrKWOhQRKLkfvmNCD/v7i
 Js8vEobvPIQIbCwnqbhPVqA3I8D3fV5O+5AjSgc0v7+v5sn9Yd0c0/j14u81zNFjBXXXGbBBJ
 1AXgMqe0aGe+INAXDyEp2s2UBoHcG3WmGLpt5rSIwQZdBMhu2keTwde7yS7s56LgSQaLpmNaG
 xn4kgxTr28k14V/BhvpmfEeDoRemyr9ugTNLkFNLXBXCgAln3foxFWb7W1IUi9DxCOACtbJzb
 TsiKbSQCJe6f3HkfzHjYx1yslf4rhFCgbqPuMVg/iph280IPBfThrIHiP2PeH+N9KnMrF1aY4
 4hpyW/tfIjy996MhsId+RiMu2S73wNrcfp6TYB0jC8DNHkP/dhmJ8ANqueFPA2eB4NtBywF/K
 W7GYnMxXCLvzE7KLqBBodY9K1MY2KZv95g6ix8SQRS+QWBE/hLgfTD4owkO2U38rOGNMVaICk
 mcijowvhuV8XmlohTPH+JHVRmgO10tOQ91/nsqZAIQ4Qf57kCgYxiP9hJkVUs6z9ypNEqAu4s
 sZLmAc3c/ofY9jTwAYOgNneikmAVBZrBtY7OegO/DN7hyUZH3v495fyJKHhCzV2cj2ho/yHHB
 EOAM4UJ35HObPYvLzNy04EmIkccW4yNWO6MRafvlfBGXt0lqFI=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Older compilers like gcc-4.8 don't see that the variable is
initialized when it is used:

In file included from include/linux/compiler_types.h:68:0,
                 from <command-line>:0:
drivers/hid/intel-ish-hid/ishtp-fw-loader.c: In function 'load_fw_from_host':
include/linux/compiler-gcc.h:75:45: warning: 'fw_info.ldr_capability.max_dma_buf_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
 #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                                             ^
drivers/hid/intel-ish-hid/ishtp-fw-loader.c:770:22: note: 'fw_info.ldr_capability.max_dma_buf_size' was declared here
  struct shim_fw_info fw_info;
                      ^

Make sure to initialize it before returning an error from ish_query_loader_prop().

Fixes: 91b228107da3 ("HID: intel-ish-hid: ISH firmware loader client driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index aa2dbed30fc3..6cf59fd26ad7 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -480,6 +480,7 @@ static int ish_query_loader_prop(struct ishtp_cl_data *client_data,
 			    sizeof(ldr_xfer_query_resp));
 	if (rv < 0) {
 		client_data->flag_retry = true;
+		*fw_info = (struct shim_fw_info){};
 		return rv;
 	}
 
@@ -489,6 +490,7 @@ static int ish_query_loader_prop(struct ishtp_cl_data *client_data,
 			"data size %d is not equal to size of loader_xfer_query_response %zu\n",
 			rv, sizeof(struct loader_xfer_query_response));
 		client_data->flag_retry = true;
+		*fw_info = (struct shim_fw_info){};
 		return -EMSGSIZE;
 	}
 
-- 
2.26.0

