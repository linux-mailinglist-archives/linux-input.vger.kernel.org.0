Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19EEA2D52C4
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 05:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgLJEYO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 23:24:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgLJEYO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 23:24:14 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F40AC0613CF;
        Wed,  9 Dec 2020 20:23:34 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id 4so2128241plk.5;
        Wed, 09 Dec 2020 20:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XNHPz0YAoN0UuSkSu06R7wbjCuX1P69SVLGZfK7SmBw=;
        b=dqHBs+bUn+swPA3aSuJh+fZuzU4Az3QVxSN3e1DFUPjKsC9YkIYEwO5lW0zWW7px1P
         SpqbeNHxU8VmQkYBNQjbJNdMWTbS9ngCdesEetAdOyaOFQstf2ZcDk/vxy64DkuRV77O
         CY5DB1kFynjtmePeI8yiHlDMx9/iJnENYYvCc1+9R6xyclmjb11NDHF6J3wtwmxObAil
         lqunI0hsiyEA5jTH6BSsyohsI0H/XCk3JLUGjlgjnkxbGKkTri5a4B0Km3xOc3RCVew1
         6ifuWrBDMOsJTJVsT8YG4+rozqF7rje0woVilvH20GG3UuXL+tzx8WtJZJwM+d8coMuL
         GmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XNHPz0YAoN0UuSkSu06R7wbjCuX1P69SVLGZfK7SmBw=;
        b=ozCZr7Lu9AA046gWyGT6U+APa2Jcl1FRPfsdc5JJkc8Z9cjwItDyV3TA80Sq5Qu4zf
         RKMOCMpT6U0YKuQcuc7+cKJRSuiQ1DW4tRtevdIc6WJTWOfarEDojw8AJCtWaUJFpJRl
         OIHCEl+Y1Im8oWfXrQO4sYo+syAlv2Qj2mjosqWVqm2AS0gYKeN1Q2Ku+lS3/7XzOI+R
         cdcpvjACRS1mmN4GF2GI4yZUBcGuIhX9i4IvnNI2shzbtcgmWqvQlIygkCV3FBlTvq8M
         FrbTgqVZ7yVz58oICc4pra8XlgT5k0WNC9+MxGZI9gPTli9D8O809WBhy2i/jVUueoe2
         Hkkg==
X-Gm-Message-State: AOAM533qWUiGWzDrTR1vxx5GqXS2R5DZBYSCIg9QkuxovzsmmUrE4ouc
        gSz/FsxuHoed3j7rryVjVDMjYxXMwKk=
X-Google-Smtp-Source: ABdhPJy+DAc7efiMhm1rt0hmJdImDLdOU1fhoQkPtkkWBYjQIrU0KffJfmkgVq4a00z1MkMfOgshCw==
X-Received: by 2002:a17:902:6ac8:b029:da:d645:ab58 with SMTP id i8-20020a1709026ac8b02900dad645ab58mr5118182plt.25.1607574213457;
        Wed, 09 Dec 2020 20:23:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x1sm4568799pfj.95.2020.12.09.20.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 20:23:32 -0800 (PST)
Date:   Wed, 9 Dec 2020 20:23:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     syzbot <syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com>
Cc:     eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, vulab@iscas.ac.cn
Subject: Re: WARNING in cm109_input_ev/usb_submit_urb
Message-ID: <X9GiwQsABTa/zC/t@google.com>
References: <000000000000f6530105b48b2816@google.com>
 <000000000000a023c905b588314b@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000a023c905b588314b@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git f6d088b4efe9636b0c5144e8ef36d785214e62cd
