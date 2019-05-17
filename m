Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBA521CA0
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 19:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbfEQRjY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 13:39:24 -0400
Received: from mga12.intel.com ([192.55.52.136]:30495 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbfEQRjY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 13:39:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 May 2019 10:39:23 -0700
X-ExtLoop1: 1
Received: from spandruv-mobl.amr.corp.intel.com ([10.255.71.203])
  by orsmga004.jf.intel.com with ESMTP; 17 May 2019 10:39:23 -0700
Message-ID: <1d179626354a74376ae09cb859e36fbb04bddc46.camel@linux.intel.com>
Subject: Re: Query Regarding HID input Report Descriptor
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "jic23@kernel.org" <jic23@kernel.org>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Date:   Fri, 17 May 2019 10:39:22 -0700
In-Reply-To: <110b8fce-5539-ac1f-1b95-39e46ccbac8c@amd.com>
References: <SN1PR12MB25755449BDADB0BD0DBB9CF7A06F0@SN1PR12MB2575.namprd12.prod.outlook.com>
         <02e0cd088dfec0635aab950af413794215531481.camel@linux.intel.com>
         <ad21ea67-771f-d1e9-96f5-64aa9f1b4603@amd.com>
         <110b8fce-5539-ac1f-1b95-39e46ccbac8c@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2019-05-15 at 16:28 +0000, Shah, Nehal-bakulchandra wrote:
> Hi All,
> 
> 
> I am working on sensor driver for AMD platform and in our platform,
> firmware doesn't give data in HID format. So i am writing interface
> driver which makes
> firmware data into HID Report format.Now i have taken reference from
> HID Usage document and i have created sample descriptor like this for
> accel 3d.
> 
> static const u8 HID_Sensor_ReportDesc_acc[]= 
> {
> 	HID_USAGE_PAGE_SENSOR,
> 	HID_USAGE_SENSOR_TYPE_MOTION_ACCELEROMETER_3D,
> 	HID_COLLECTION(Physical),
> 
> 	//feature reports (xmit/receive)
> 	HID_REPORT_ID(1),
> 	HID_USAGE_PAGE_SENSOR,
> 	HID_USAGE_SENSOR_PROPERTY_SENSOR_CONNECTION_TYPE,  // NAry
> 	HID_LOGICAL_MIN_8(0),
> 	HID_LOGICAL_MAX_8(2),
> 	HID_REPORT_SIZE(8),
> 	HID_REPORT_COUNT(1),
> 	HID_COLLECTION(Logical),
> 	HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_INTEGRATED_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_ATTACHED_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_EXTERNAL_SEL,
> 	HID_FEATURE(Data_Arr_Abs),
> 	HID_END_COLLECTION,
> 	HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE,
> 	HID_LOGICAL_MIN_8(0),
> 	HID_LOGICAL_MAX_8(5),
> 	HID_REPORT_SIZE(8),
> 	HID_REPORT_COUNT(1),
> 	HID_COLLECTION(Logical),
> 	HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_NO_EVENTS_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_ALL_EVENTS_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_THRESHOLD_EVENTS_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_NO_EVENTS_WAKE_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_ALL_EVENTS_WAKE_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_REPORTING_STATE_THRESHOLD_EVENTS_WAKE
> _SEL,
> 	HID_FEATURE(Data_Arr_Abs),
> 	HID_END_COLLECTION,
> 	HID_USAGE_SENSOR_PROPERTY_POWER_STATE,
> 	HID_LOGICAL_MIN_8(0),
> 	HID_LOGICAL_MAX_8(5),
> 	HID_REPORT_SIZE(8),
> 	HID_REPORT_COUNT(1),
> 	HID_COLLECTION(Logical),
> 	HID_USAGE_SENSOR_PROPERTY_POWER_STATE_UNDEFINED_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D0_FULL_POWER_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D1_LOW_POWER_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D2_STANDBY_WITH_WAKE_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D3_SLEEP_WITH_WAKE_SEL,
> 	HID_USAGE_SENSOR_PROPERTY_POWER_STATE_D4_POWER_OFF_SEL,
> 	HID_FEATURE(Data_Arr_Abs),
> 	HID_END_COLLECTION,
> 	HID_USAGE_SENSOR_STATE,
> 	HID_LOGICAL_MIN_8(0),
> 	HID_LOGICAL_MAX_8(6),
> 	HID_REPORT_SIZE(8),
> 	HID_REPORT_COUNT(1),
> 	HID_COLLECTION(Logical),
> 	HID_USAGE_SENSOR_STATE_UNKNOWN_SEL,
> 	HID_USAGE_SENSOR_STATE_READY_SEL,
> 	HID_USAGE_SENSOR_STATE_NOT_AVAILABLE_SEL,
> 	HID_USAGE_SENSOR_STATE_NO_DATA_SEL,
> 	HID_USAGE_SENSOR_STATE_INITIALIZING_SEL,
> 	HID_USAGE_SENSOR_STATE_ACCESS_DENIED_SEL,
> 	HID_USAGE_SENSOR_STATE_ERROR_SEL,
> 	HID_FEATURE(Data_Arr_Abs),
> 	HID_END_COLLECTION,
> 	HID_USAGE_SENSOR_PROPERTY_REPORT_INTERVAL,
> 	HID_LOGICAL_MIN_8(0),
> 	HID_LOGICAL_MAX_32(0xFF,0xFF,0xFF,0xFF),
> 	HID_REPORT_SIZE(32),
> 	HID_REPORT_COUNT(1),
> 	HID_UNIT_EXPONENT(0),
> 	HID_FEATURE(Data_Var_Abs),
> 	HID_USAGE_SENSOR_DATA(HID_USAGE_SENSOR_DATA_MOTION_ACCELERATION
> ,HID_USAGE_SENSOR_DATA_MOD_CHANGE_SENSITIVITY_ABS),
> 	HID_LOGICAL_MIN_8(0),
> 	HID_LOGICAL_MAX_16(0xFF,0xFF),
> 	HID_REPORT_SIZE(16),
> 	HID_REPORT_COUNT(1),
> 	HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to provide
> 2 digits past the decimal point
> 	HID_FEATURE(Data_Var_Abs),
> 	HID_USAGE_SENSOR_DATA(HID_USAGE_SENSOR_DATA_MOTION_ACCELERATION
> ,HID_USAGE_SENSOR_DATA_MOD_MAX),
> 	HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-32767)
> 	HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM (32767)
> 	HID_REPORT_SIZE(16),
> 	HID_REPORT_COUNT(1),
> 	HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to provide
> 2 digits past the decimal point
> 	HID_FEATURE(Data_Var_Abs),
> 	HID_USAGE_SENSOR_DATA(HID_USAGE_SENSOR_DATA_MOTION_ACCELERATION
> ,HID_USAGE_SENSOR_DATA_MOD_MIN),
> 	HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-32767)
> 	HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM (32767)
> 	HID_REPORT_SIZE(16),
> 	HID_REPORT_COUNT(1),
> 	HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to provide
> 2 digits past the decimal point
> 	HID_FEATURE(Data_Var_Abs),
> 
> 	//input reports (transmit)
> 	HID_USAGE_PAGE_SENSOR,
> 	HID_USAGE_SENSOR_STATE,
> 	HID_LOGICAL_MIN_8(0),
> 	HID_LOGICAL_MAX_8(6),
> 	HID_REPORT_SIZE(8),
> 	HID_REPORT_COUNT(1),
> 	HID_COLLECTION(Logical),
> 	HID_USAGE_SENSOR_STATE_UNKNOWN_SEL,
> 	HID_USAGE_SENSOR_STATE_READY_SEL,
> 	HID_USAGE_SENSOR_STATE_NOT_AVAILABLE_SEL,
> 	HID_USAGE_SENSOR_STATE_NO_DATA_SEL,
> 	HID_USAGE_SENSOR_STATE_INITIALIZING_SEL,
> 	HID_USAGE_SENSOR_STATE_ACCESS_DENIED_SEL,
> 	HID_USAGE_SENSOR_STATE_ERROR_SEL,
> 	HID_INPUT(Data_Arr_Abs),
> 	HID_END_COLLECTION,
> 	HID_USAGE_SENSOR_EVENT,
> 	HID_LOGICAL_MIN_8(0),
> 	HID_LOGICAL_MAX_8(5),
> 	HID_REPORT_SIZE(8),
> 	HID_REPORT_COUNT(1),
> 	HID_COLLECTION(Logical),
> 	HID_USAGE_SENSOR_EVENT_UNKNOWN_SEL,
> 	HID_USAGE_SENSOR_EVENT_STATE_CHANGED_SEL,
> 	HID_USAGE_SENSOR_EVENT_PROPERTY_CHANGED_SEL,
> 	HID_USAGE_SENSOR_EVENT_DATA_UPDATED_SEL,
> 	HID_USAGE_SENSOR_EVENT_POLL_RESPONSE_SEL,
> 	HID_USAGE_SENSOR_EVENT_CHANGE_SENSITIVITY_SEL,
> 	HID_INPUT(Data_Arr_Abs),
> 	HID_END_COLLECTION,
> 	HID_USAGE_SENSOR_DATA_MOTION_ACCELERATION_X_AXIS,
> 	HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-32767)
> 	HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM (32767)
> 	HID_REPORT_SIZE(16),
> 	HID_REPORT_COUNT(1),
> 	HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to provide
> 2 digits past the decimal point
> 	HID_INPUT(Data_Var_Abs),
> 	HID_USAGE_SENSOR_DATA_MOTION_ACCELERATION_Y_AXIS,
> 	HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-32767)
> 	HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM (32767)
> 	HID_REPORT_SIZE(16),
> 	HID_REPORT_COUNT(1),
> 	HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to provide
> 2 digits past the decimal point
> 	HID_INPUT(Data_Var_Abs),
> 	HID_USAGE_SENSOR_DATA_MOTION_ACCELERATION_Z_AXIS,
> 	HID_LOGICAL_MIN_16(0x01,0x80), //    LOGICAL_MINIMUM (-32767)
> 	HID_LOGICAL_MAX_16(0xFF,0x7F), //    LOGICAL_MAXIMUM (32767)
> 	HID_REPORT_SIZE(16),
> 	HID_REPORT_COUNT(1),
> 	HID_UNIT_EXPONENT(0x0E),  // scale default unit "G" to provide
> 2 digits past the decimal point
> 	HID_INPUT(Data_Var_Abs),
> 
> 	//include the following datafield if required to support the
> shake event
> 	HID_USAGE_SENSOR_DATA_MOTION_STATE,
> 	HID_LOGICAL_MIN_8(0), // False = Still
> 	HID_LOGICAL_MAX_8(1), // True = In Motion
> 	HID_REPORT_SIZE(8),
> 	HID_REPORT_COUNT(1),
> 	HID_INPUT(Data_Var_Abs),
> 
> 	HID_END_COLLECTION
> };
> 
> for Feature report i have created following structure
> 
> struct accel3_feature_report
> {
> 	//common properties
> 	u8 	    reportid;
> 
> 	u8	    connectiontype;
> 	u8          reportstate;
> 	u8          powerstate;
> 	u8	    sensorstate;
> 	u32         reportinterval;
> 
> 	//properties specific to this sensor
> 	u16         accelsensitiity;
> 	u16        accelmax;
> 	u16	    accelmin;
> 
> } ;
> 
> Can some one help me is this the correct way of going forward? With
> this i am getting request for feature report and i can see device in
> iio bus also but i am not getting call for input report. Please help
> me in this regards.
You will get call for input report when you try to read.

For example:
#cat in_accel_*_raw

Thanks,
Srinivas


> 
> Thanks 
> Nehal Shah
> 
> 

