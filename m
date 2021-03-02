Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8083C32B4BC
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354182AbhCCF1O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351083AbhCBWi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:38:56 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E36DC06178C;
        Tue,  2 Mar 2021 14:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=9nUBbwHQD30v0wZhqneE7HpdlVGkuxDUvd6OmHc/vyE=; b=CVh8jlE+HNWY9bMLykTH5jh/iR
        TQQxJgdLLr5oEX4lZfjBkJWnuxd+AhTVLdVyxSD4m2PiXje+bJfh1V7vAOVhlwtZolUFAsbrA3qdI
        irayKN73/1CRQUdD3ypHqHghyM97sQWyL8rZBn8i6l8P/oVoOtBUH3gwYz0tF4EyG/7CxDo5l68BN
        aVrvmhA9XbS3VLZJ91cmYphu82K00Z8VWai58Kkc9Pv3gi2FsZ2guuBRc5XhzLrLLU0EEq5xgWioi
        cBL7xPW3mA59WH3dblvgEPQ4QYV/q2UriZC6CbHEwBjWpF4J+kBPuS7a8hAwKqmttAYVvAiGG+dys
        vRtufIlw==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHDby-000WSO-R3; Tue, 02 Mar 2021 22:35:27 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 0/8] input: Documentation: corrections to Doc/input/ files
Date:   Tue,  2 Mar 2021 14:35:15 -0800
Message-Id: <20210302223523.20130-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Update several Documentation/input/ files for wording, punctutation,
struct info, and file names.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org

 [PATCH 1/8] input: Documentation: corrections for input.rst
 [PATCH 2/8] input: Documentation: corrections for event-codes.rst
 [PATCH 3/8 RESEND] input: Documentation: update related file names in ff.rst
 [PATCH 4/8] input: Documentation: corrections for gameport-programming.rst
 [PATCH 5/8] input: Documentation: corrections for multi-touch-protocol.rst
 [PATCH 6/8] input: Documentation: corrections for notifier.rst
 [PATCH 7/8] input: Documentation: corrections for input-programming.rst
 [PATCH 8/8] input: Documentation: corrections for uinput.rst

 Documentation/input/event-codes.rst          |   10 ++--
 Documentation/input/ff.rst                   |    6 +-
 Documentation/input/gameport-programming.rst |   35 +++++++++++------
 Documentation/input/input-programming.rst    |   20 ++++-----
 Documentation/input/input.rst                |    8 +--
 Documentation/input/multi-touch-protocol.rst |    8 +--
 Documentation/input/notifier.rst             |    3 -
 Documentation/input/uinput.rst               |    2 
 8 files changed, 52 insertions(+), 40 deletions(-)
