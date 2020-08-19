Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D1E249E6E
	for <lists+linux-input@lfdr.de>; Wed, 19 Aug 2020 14:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgHSMom (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Aug 2020 08:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728432AbgHSMoG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Aug 2020 08:44:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08B56206B5;
        Wed, 19 Aug 2020 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597841043;
        bh=6rLq2GEJmt4Ob1rHN/I7tzdkg8m4AVjM7i9gXSubYo4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bHRFVboNCn2DcIda6HFf5UZZsvIHY0ETlTwvYEaQxl4qc6ni0QdFCDVTHPicrwnsu
         94V3tm8+YbsaiV3v42p4Nrd6ACBgXvzzBSuvpuSXSIRaAcGLQAY1KBLZ0PV/JlPID0
         K/96P4YWrT3Km0ezNutqb8aUoQeUD8VJX91R/5Lg=
Date:   Wed, 19 Aug 2020 14:44:25 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?5b2t5rWp?= <penghao@uniontech.com>
Cc:     jikos <jikos@kernel.org>,
        "benjamin.tissoires " <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] USB HID: Add disabled wakeup from s3 by touchpad on
 bydzhaoxin notebook
Message-ID: <20200819124425.GA1469922@kroah.com>
References: <20200819115101.22532-1-penghao@uniontech.com>
 <20200819120856.GA931936@kroah.com>
 <285385314.979590.1597840631436.JavaMail.xmail@bj-wm-cp-2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <285385314.979590.1597840631436.JavaMail.xmail@bj-wm-cp-2>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 19, 2020 at 08:37:11PM +0800, 彭浩 wrote:
> Thank you for your guidance, can you tell me how to improve ?
> 
> 
> thanks,   
> penghao
> 
> 
> 统信软件技术有限公司
> 
> UnionTech Software Technology Co., Ltd. 　
> 
> 官网：www.uniontech.com　　
> 
> 
> 此电子邮件消息仅供预期收件人使用，其中可能包含保密或特权使用信息。如果您不是预
> 期收件人，请勿使用、传播、分发或复制此电子邮件或信赖此邮件采取任何行动。如果您
> 误收了此邮件，请立即回复邮件通知统信软件技术有限公司发件人，并删除误收电子邮件
> 及其相关附件。感谢配合！  
> 
>  
> This email message is intended only for the use of the individual or entity who
> /which is the intended recipient and may contain information that is privileged
> or confidential. If you are not the intended recipient, you are hereby notified
> that any use, dissemination, distribution or copying of, or taking any action
> in reliance on, this e-mail is strictly prohibited. If you have received this
> email in error, please notify UnionTech Software Technology  immediately by
> replying to this e-mail and immediately delete and discard all copies of the
> e-mail and the attachment thereto (if any). Thank you.  

Footers like this mean I have to delete it and can not respond as it is
not compatible with Linux kernel development, sorry :(
