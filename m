Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5846C17B554
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 05:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgCFEQq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 23:16:46 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50427 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbgCFEQq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Mar 2020 23:16:46 -0500
Received: by mail-pj1-f67.google.com with SMTP id nm6so510860pjb.0;
        Thu, 05 Mar 2020 20:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OETmZOWuYxzqpD4nN0IaLvhHG/zD5kORW1mWO5A2/z4=;
        b=OvmNNoNNY790wtUMMvLft86Sx9H7W55ZIp68NrnAoOWkBJ/sKf+QcnvGJ/1DdmhL6g
         C2Anul6xRkSPJhs4i0lMHwhRhnj8OS230at0IIeFkZMm/p/kr3Olx7yvXiG/BjAbjhV+
         A+rACXQQqYUpduuzBj4HN3kQ/ykRkbhPBSBWbPJaNabuyWOCrlKWpvoS7v44dXRS9YGV
         uHQ+/A+wvdslISBWCMkk3QXiihwg4M8ZvTeViJnT61gFzRQDqCoqNGb3pUTiGG4DwJhW
         HEuliT/ZfW3SqOvmUacS/yCUF3NX0qziedav5MdnWR7V4hExpgvghc0DzBpXkVM8o/nI
         uaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OETmZOWuYxzqpD4nN0IaLvhHG/zD5kORW1mWO5A2/z4=;
        b=gJgL0Pby1nxz/C60yjdpHnDHIjZAVfq2g7rMjgyD4efxin+m+mIP+akWXYSScxuhx8
         //OhWLVNwsYBIeG6Q4n2o6MgU25VBeuJsTq7V2bX8TYnWCkr6jj0sUk65JH8IHM5juj6
         QJivz8JFSJb6W8OW/NjpqvvPAuqTMzuKvhMzNalDLrx1Muw3M61SPKNm5o74/SzVBnmY
         68gyjqBNqqUbgqLWKHHWZblVU7OzfdCfNxGFdXEU87AdaOBwlJPhv9LZEBlKXT5kxTfM
         TU+3K5R0SSxrt+b6DoHmxrPRr3u0awxj68+qepk9HvVF/vNRvLdUIPP3xCtNtU47L4l4
         nyMg==
X-Gm-Message-State: ANhLgQ0kw8VTczAo1KOvQjIX7lJ926KR8chsWympfuE4b1XiMnbexYXe
        rvzH5Si4qC34j3w9LENRqWg=
X-Google-Smtp-Source: ADFU+vsW09XQ9T4cmUMX7PG1FDxhw/xJlaJfDtOFyqZJAjoOWsXEbIS5DQ7RsBSG74pgBDHDGAT2rw==
X-Received: by 2002:a17:902:8eca:: with SMTP id x10mr1144516plo.94.1583468204939;
        Thu, 05 Mar 2020 20:16:44 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id m59sm7967420pjb.41.2020.03.05.20.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 20:16:44 -0800 (PST)
Date:   Thu, 5 Mar 2020 20:16:42 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     AceLan Kao <acelan.kao@canonical.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - Fix the selftest retry logic
Message-ID: <20200306041642.GD217608@dtor-ws>
References: <20200305064423.16196-1-acelan.kao@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305064423.16196-1-acelan.kao@canonical.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi AceLan,

On Thu, Mar 05, 2020 at 02:44:23PM +0800, AceLan Kao wrote:
> It returns -NODEV at the first selftest timeout, so the retry logic
> doesn't work. Move the return outside of the while loop to make it real
> retry 5 times before returns -ENODEV.

The retry logic here was for the controller not returning the expected
selftest value, not the controller refusing to communicate at all.

Could you pease tell me what device requires this change?

Thanks.

-- 
Dmitry
