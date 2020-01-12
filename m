Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72945138AEC
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 06:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgAMFac (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 00:30:32 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:40341 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgAMFac (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 00:30:32 -0500
IronPort-SDR: faUguVMfgz4dJgbutFacNhC57fIn7iJvpiWRwF7d6TSRlwSEL2y+3cQ4HtTlH7Un409qzzJoor
 hzf3ZdsiA4Hw==
IronPort-PHdr: =?us-ascii?q?9a23=3A50G1QhecoWLku+2KmlNgjzDblGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxcSzZx7h7PlgxGXEQZ/co6odzbaP6Oa6Bz1LsczJmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MRu7oR/PusQXhYZuJaU8xg?=
 =?us-ascii?q?XUqXZUZupawn9lK0iOlBjm/Mew+5Bj8yVUu/0/8sNLTLv3caclQ7FGFToqK2?=
 =?us-ascii?q?866tHluhnFVguP+2ATUn4KnRpSAgjK9w/1U5HsuSbnrOV92S2aPcrrTbAoXD?=
 =?us-ascii?q?mp8qlmRAP0hCoBKjU19mbbhNFsg61BpRKgpwVzzpDTYIGPLPp+ebndcskGRW?=
 =?us-ascii?q?VfR8peSSpBDpqgYosTE+oOJ/pXr4njqFsLsxS+AxWsCPrxxT9On3P42qo60+?=
 =?us-ascii?q?I/HgDGxQAvAdQOu2nQoNj7KKseTeW5wa/VxjvBcvxWwy/w5obIfBA7v/+CXq?=
 =?us-ascii?q?9+fsXNxkcgDA7FkledppD5Mz+JyugBrW6W5PdgW+K1jG4nrhl8rCKxyccwlI?=
 =?us-ascii?q?bJnJ8exVDD9SV/z4Y+ONq1SFZlbt64DpRQrS+bN4xwQsMtWGxouD06xaYatp?=
 =?us-ascii?q?KhYCcKz5EnywTfa/yEaoWF5A/oWuWJITpgmn5pZbCyiwyv/UWu1uHwTNe43V?=
 =?us-ascii?q?lQoidLktTBsG0G2QbJ5cidUPR9+1+s2TOI1w/O9O5JOVs0la/HK545xb4wi4?=
 =?us-ascii?q?YTvVzDHiDonEX2i7ebdkA+9eip7+TneKvpppuAO4J7kA3+LKMuldGlDuQ2NQ?=
 =?us-ascii?q?gOWXaU9f6i27345UH5QbNKgeMqkqTBrpzWOMYWqrSkDwJbzoov8QizAji83N?=
 =?us-ascii?q?kWnXQLNFdFdwiGj4jtNVHOOvf4DfKnjlS0jjhr2+7JPqfvA5XKKHjDn6zsfb?=
 =?us-ascii?q?Zm60FH1AU/18xQ55VRCr0bIPLzWVf9tMbEAR8hLwy03+HnBc151oMfX2KPH6?=
 =?us-ascii?q?CYPLrTsV+O/uIvPvWMaZQLuDbyNfcl/eTijXwnll8He6mmw58XZGq/HvR8LE?=
 =?us-ascii?q?XKKUbr19MAF3oa+ws4VPH2oEONXCQVZHuoWa84oDYhB9GcAJ/HV7yq1YSMwC?=
 =?us-ascii?q?qhVqJRYG8OXkiBDXryaIKCVPcPaDmYKedulzUFUf6qTIp3hj+0swqv87d7I/?=
 =?us-ascii?q?CcxSoeutq3zNVp6vfMkhc93TxvBc/b2GaICWF3yDBbDwQq1bxy9BUugmyI1r?=
 =?us-ascii?q?J11qcATdE=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ETKgB8/xtemCMYgtkUBjMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4E?=
 =?us-ascii?q?Agx4VhggTDIFbDQEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAE?=
 =?us-ascii?q?BAhABAQEBAQYNCwYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4M?=
 =?us-ascii?q?EgksBATOFI5dQAY0EDQ0ChR2CRAQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V4EMDXpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IPAS-Result: =?us-ascii?q?A2ETKgB8/xtemCMYgtkUBjMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbD?=
 =?us-ascii?q?QEBAQEBNQIBAYRATgEXgQ8kOgQNAgMNAQEFAQEBAQEFBAEBAhABAQEBAQYNC?=
 =?us-ascii?q?wYphUqCHQweAQQBAQEBAwMDAQEMAYNdBxkPOUpMAQ4BU4MEgksBATOFI5dQA?=
 =?us-ascii?q?Y0EDQ0ChR2CRAQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V4EMD?=
 =?us-ascii?q?XpxMxqCJhqBIE8YDYgbji1AgRYQAk+JLoIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,427,1571695200"; 
   d="scan'208";a="323805421"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 13 Jan 2020 06:30:27 +0100
Received: (qmail 24274 invoked from network); 12 Jan 2020 05:00:20 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-input@vger.kernel.org>; 12 Jan 2020 05:00:20 -0000
Date:   Sun, 12 Jan 2020 06:00:19 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-input@vger.kernel.org
Message-ID: <3579162.460749.1578805220294.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

